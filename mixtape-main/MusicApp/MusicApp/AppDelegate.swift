//
//  AppDelegate.swift
//  MusicApp
//
//  Created by Scholar on 8/16/22.
//

import UIKit
import CoreData
//import SpotifyiOS.framework


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    //class AppDelegate: UIResponder, UIApplicationDelegate, SPTSessionManagerDelegate {

    // nov 27yh advanced user authorization https://developer.spotify.com/documentation/ios/quick-start
    // This will require us to implement the following three methods:
    //```swift
    //func sessionManager(manager: SPTSessionManager, didInitiate session: SPTSession) {
      //print("success", session)
    //}
    //func sessionManager(manager: SPTSessionManager, didFailWith error: Error) {
      //print("fail", error)
    //}
    //func sessionManager(manager: SPTSessionManager, didRenew session: SPTSession) {
      //print("renewed", session)
    //}
    //```

    //#### Instantiate `SPTConfiguration`

    //At a class-level, we can define our Client ID, Redirect URI and instantiate the SDK:

    //```swift
    //let SpotifyClientID = "9d4be7f686624917a9d885eb1d45e587"
    //let SpotifyRedirectURL = URL(string: "spotify-ios-quick-start://spotify-login-callback")!

    //lazy var configuration = SPTConfiguration(
       // clientID: Constants.SpotifyClientID,
        //redirectURL: Constants.SpotifyRedirectURL
    //)
    
    //```swift
    //lazy var sessionManager: SPTSessionManager = {
      //if let tokenSwapURL = URL(string: "https://glitch.com/~spotify-token-swap/api/token"),
        // let tokenRefreshURL = URL(string: "https://github.com/bih/spotify-token-swap-service#one-click-with-heroku/api/refresh_token") {
       // self.configuration.tokenSwapURL = tokenSwapURL
       // self.configuration.tokenRefreshURL = tokenRefreshURL
        //self.configuration.playURI = ""
      //}
      //let manager = SPTSessionManager(configuration: self.configuration, delegate: self)
     // return manager
   // }()
    //```
    //#### Configure Initial Music

   // iOS requires us to define a `playURI` (as shown in the last step) in order to play music to wake up the Spotify main application. This is an iOS-specific requirement. There's two values `self.configuration.playURI` accepts:

    //**An empty value:** If empty, it will resume playback of user's last track. Example:

   // ```swift
   // self.configuration.playURI = ""
   // ```

    //**A valid Spotify URI:** Otherwise, provide a Spotify URI. Example:

    //```swift
    //self.configuration.playURI = "spotify:track:20I6sIOMTCkB6w7ryavxtO"
    //```
    
    //#### Invoke Auth Modal

    //With `SPTConfiguration` and `SPTSessionManager` both configured, we can invoke the authorization screen:

    //```swift
   // let requestedScopes: SPTScope = [.appRemoteControl]
    //self.sessionManager.initiateSession(with: requestedScopes, options: .default)
    //```
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
       // setupSpotify()
        return true
    }
    
    

    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "MusicApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

