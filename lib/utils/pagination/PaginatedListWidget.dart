/*
 * Copyright 2020 Harshith Shetty (justadeveloper96@gmail.com)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/utils/pagination/ListLoader.dart';

import 'BottomLoader.dart';
import 'PaginatedListState.dart';

class PaginatedListWidget<T> extends StatefulWidget {
  final Function onRetryClick;
  final Function onEndReached;
  final PaginatedListState state;
  Widget Function(BuildContext context, int index, T data) listItemBuilder;
  Widget Function(BuildContext context) emptyDataWidgetBuilder;
  Widget Function(BuildContext context) errorWidgetBuilder;

  bool reverse;

  PaginatedListWidget(
      this.state, this.listItemBuilder, this.onRetryClick, this.onEndReached,
      {this.reverse = false,
      this.emptyDataWidgetBuilder,
      this.errorWidgetBuilder});

  @override
  _PaginatedListWidgetState createState() => _PaginatedListWidgetState();
}

class _PaginatedListWidgetState extends State<PaginatedListWidget> {
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  final _scrollThreshold = 200.0;
  final _scrollController = ScrollController();

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      widget.onEndReached();
    }
  }

  Future<void> _refresh() async {
    widget.onRetryClick();
  }

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    if (state is ListLoading) {
      return Center(
        child: ListLoader(),
      );
    } else if (state is ListLoaded) {
      if (state.list.isEmpty) {
        return widget.emptyDataWidgetBuilder != null
            ? widget.emptyDataWidgetBuilder(context)
            : Center(child: Text("Data Not found!"));
      } else {
        return buildList(state, context);
      }
    } else if (state is ListError) {
      return errorRetryButton(context);
    }
    return Container();
  }

  Widget buildList(ListLoaded<dynamic> state, BuildContext context) {
    final actualItems = state.list.length;
    final itemsToShow =
        state.hasReachedMax ? state.list.length : state.list.length + 1;
    return RefreshIndicator(
        key: refreshKey,
        onRefresh: () async {
          _refresh();
        },
        child: ListView.builder(
          reverse: widget.reverse,
          controller: _scrollController,
          itemBuilder: (context, postion) =>
          (postion >= actualItems)
              ? BottomLoader()
              : widget.listItemBuilder(context, postion, state.list[postion]),
          itemCount: itemsToShow,
        ));
  }

  Widget errorRetryButton(BuildContext context) {
    return widget.errorWidgetBuilder != null
        ? widget.errorWidgetBuilder(context)
        : Container(
            child: Center(
              child: RaisedButton(
                child: Text('Retry'),
                textColor: Colors.white,
                onPressed: () {
                  widget.onRetryClick();
                },
              ),
            ),
          );
  }
}
