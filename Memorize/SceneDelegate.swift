//
//  SceneDelegate.swift
//  Memorize
//
//  Created by Satveer Singh on 5/24/20.
//  Copyright © 2020 Satveer Singh. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
        // Create themes
        
            var themes = [Theme]()
            themes.append(Theme(name: "Halloween", numberOfCards: 8, emoji: ["👻","🎃","☠️","💀","😈","✂️","👣","🧟‍♀️","🧟‍♂️","🦹🏿‍♀️","🥼","🦹🏻‍♂️","💉"], color: .orange))
            themes.append(Theme(name: "Faces" , numberOfCards: 12, emoji: ["😀","😁","😅","😂","🤣","😇","🙃","😌","😚","😛","😝","🤪","🤨","😎","🤩","🧐","😖","😭","🥳","😣","😳","😠"], color: .blue))
            themes.append(Theme(name: "Flags", numberOfCards: 6, emoji: ["🇹🇩","🇲🇷","🇲🇻","🏁","🇨🇦","🇹🇹","🇹🇼","🇦🇺","🇯🇲","🇻🇳","🇨🇭","🇹🇭","🇦🇹","🇹🇯","🇨🇷","🇨🇨","🇬🇧"], color: .gray))
            themes.append(Theme(name: "Games", numberOfCards: 10, emoji: ["⚽️","🏀","🏈","⚾️","🎱","🏓","🏸","🏒","🏏","⛳️","🪁","🎣","🥊","⛸","🥌","⛷","🚴‍♀️","🛹","🏐","🏉","🥏","🏂","🏹"], color: .blue))
            themes.append(Theme(name: "Symbols", numberOfCards: 6, emoji: ["®","©","℗","№","℔","℥","ℨ","ℬ","µ","Ω","ℹ︎","ℌ","ℑ","℞","ℳ","℀","℁","℅","℆","™","℠"], color: .red))
            themes.append(Theme(name: "Animals", numberOfCards: 10, emoji: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐮","🐷","🐸","🐵","🦄","🐙","🦕","🦑","🦉","🦞","🐒"], color: .yellow))
    
        
        // Add emogi memory game
        let emojiMemoryGame = EmojiMemoryGame()
        let contentView = EmojiMemoryGameView(viewModel: emojiMemoryGame)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

