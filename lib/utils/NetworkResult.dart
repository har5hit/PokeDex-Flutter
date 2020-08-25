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

import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkResult<T> {
  int code;
  STATUS status;
  T data;
  String message;

  NetworkResult(this.code, this.status, this.data);

  NetworkResult.success(
      {this.data,
      this.code = 200,
      this.status = STATUS.SUCCESS,
      this.message = ""});

  NetworkResult.error(
      {this.message, this.code = -1, this.status = STATUS.ERROR});

  @override
  String toString() {
    return 'NetworkResult{code: $code, status: $status, data: $data}';
  }

  NetworkResult.unsuccessful(String json,
      {this.code, this.status = STATUS.UNSUCCESSFUL});

  NetworkResult.handle(http.Response response, T f(dynamic jsonData)) {
    this.code = response.statusCode;
    try {
      if (code == 200) {
        this.status = STATUS.SUCCESS;
        this.data = f(json.decode(response.body));
      } else {
        this.status = STATUS.UNSUCCESSFUL;
      }
      try {
        this.message = json.decode(response.body)['message'];
      } catch (e) {}
    } catch (e) {
      print(e);
      this.status = STATUS.ERROR;
      this.message = "Error!";
    }
  }
}

enum STATUS { SUCCESS, UNSUCCESSFUL, ERROR }
