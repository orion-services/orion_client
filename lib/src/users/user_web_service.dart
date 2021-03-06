/// Copyright 2020 Orion Services
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
/// http://www.apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
///  limitations under the License.
import 'package:http/http.dart' as http;
import './base_client.dart';
import 'dart:html';

class UsersWebService extends BaseClient {
  /// instatiate a UserWebService object.
  /// [bool enableSecurity] indicates is the client will work with http or https
  ///
  /// [bool devMode] modify the service URL to operates in dev mode. In development
  /// mode Open liberty modifies the service URL eliminating When we are the application
  /// name orion-user-service
  ///
  /// [String tockenChannel] indicates the token a channel (optional)
  UsersWebService(bool enableSecurity, bool devMode, [String tokenChannel])
      : super(enableSecurity, devMode) {
    // sets the tocken of a channel 
    token = tokenChannel;
  }

  /// Web Service: login the Orion Users microservices
  /// and returns [Future<http.Response>]
  Future<http.Response> login(String email, String password) {
    final Object url = wsURL + 'login';
    return http.post(url, body: {'email': email, 'password': password});
  }

  /// Web Serive: creates a user in the Oriton User microservices
  /// and returns [Future<http.Response>]
  Future<http.Response> createUser(String name, String email, String password) {
    final Object url = wsURL + 'create';
    return http
        .post(url, body: {'name': name, 'email': email, 'password': password});
  }

  /// Web Serive: Orion User microservices
  /// and returns [Future<http.Response>]
  Future<http.Response> autoConfirm(String email) {
    final Object url = wsURL + 'autoConfirm';
    return http.post(url, body: {'email': email});
  }

  /// Web Serive: Orion User microservices
  /// and returns [Future<http.Response>]
  Future<http.Response> forgotPass(String email) {
    final Object url = wsURL + 'forgotPass';
    return http.post(url, body: {'email': email});
  }

  /// Web Serive: uodate a user in the Oriton User microservices
  /// and returns [Future<http.Response>]
  Future<http.Response> updateUser(
      String id, String name, String email, String password) {
    final Object url = wsURL + 'update';
    return http.post(url,
        body: {'id': id, 'name': name, 'email': email, 'password': password});
  }

  /// Web Serive: uodate a user in the Oriton User microservices
  /// and returns [Future<http.Response>]
  Future<http.Response> deleteUser(String id) {
    final Object url = wsURL + 'delete';
    return http.post(url, body: {'id': id});
  }

  /// Web Serive: uodate a user in the Oriton User microservices
  /// and returns [Future<http.Response>]
  Future<http.Response> listUser(String id) {
    final Object url = wsURL + 'list' + '/' + id;
    print(url);
    return http.get(url);
  }
}
