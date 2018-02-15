//
//  ApiResult.swift
//  TinyApiClient
//
//  Created by Daniel Lozano on 11/15/16.
//  Copyright © 2016 Daniel Lozano. All rights reserved.
//

import Foundation

public enum ApiResult<T> {

	case success(resource: T, meta: Metadata)
	case error(ApiError)

}

public struct Metadata {

	public let statusCode: Int
	public let headers: JSONDictionary?
	public let other: JSONDictionary?

}

public enum ApiError: Error {

	public struct Metadata {
		public let statusCode: Int
		public let errorMessages: [String]?
	}

    // MARK: - API Errors

    case clientError(Metadata)
    case serverError(Metadata)
    case notFound(Metadata)
    case invalidToken(Metadata)
    case invalidCredentials(Metadata)

    // MARK: - Local, Unknown errors

    case localError(Error)
    case cancelled
    case unexpectedResponse(Any)
    case unknownError

}
