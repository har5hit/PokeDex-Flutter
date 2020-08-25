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

abstract class PaginatedListState {}

abstract class ListLoading implements PaginatedListState {}

abstract class ListLoaded<T> implements PaginatedListState {
  final List<T> list;
  final bool hasReachedMax;

  ListLoaded({this.list, this.hasReachedMax});

  @override
  String toString() =>
      'ListLoaded  ${list.length}, hasReachedMax: $hasReachedMax }';
}

abstract class ListError implements PaginatedListState {
  final String message;

  ListError(this.message);
}
