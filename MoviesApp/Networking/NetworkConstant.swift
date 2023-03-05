//
//  NetworkConstant.swift
//  MoviesApp
//
//  Created by iOSayed on 05/03/2023.
//

import Foundation

class NetworkConstant {
    
    public static var shared = NetworkConstant()
    
    
    var apiKey:String{
        get {
            return "641cb501d987f7743ca0b747641c3aa0"
        }
    }
    
    public var serverAddress:String{
        get{
            return "https://api.themoviedb.org/3/"
        }
    }
    public var imageServerAddress:String{
        get{
            return "https://image.tmdb.org/t/b/w500/"
        }
    }
}
