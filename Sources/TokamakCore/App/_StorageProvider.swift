// Copyright 2020-2021 Tokamak contributors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//  Created by Carson Katri on 7/22/20.
//

#if canImport(OpenCombineShim)
import OpenCombineShim
#endif

public protocol _StorageProvider {
  func store(key: String, value: Bool?)
  func store(key: String, value: Int?)
  func store(key: String, value: Double?)
  func store(key: String, value: String?)

  func read(key: String) -> Bool?
  func read(key: String) -> Int?
  func read(key: String) -> Double?
  func read(key: String) -> String?

  static var standard: _StorageProvider { get }
#if canImport(OpenCombineShim)
  var publisher: ObservableObjectPublisher { get }
#endif
}
