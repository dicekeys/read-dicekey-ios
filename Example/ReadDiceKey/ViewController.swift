//
//  ViewController.swift
//  ReadDiceKey
//
//  Created by nmtitov on 11/05/2020.
//  Copyright (c) 2020 nmtitov. All rights reserved.
//

import UIKit
import ReadDiceKey

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // Test
        do {
            // Load test image from bundle
            let image = UIImage(named: "test")!

            let w = image.cgImage!.width
            let h = image.cgImage!.height

            let bitmap = image.bitmap!

            // Test API
            // Initialize wrapper
            let wrapper = DKImageProcessor.create()!
            
            // Call API methods
            print(wrapper.process(bitmap, width: Int32(w), height: Int32(h)))
            print(wrapper.overlay(bitmap, width: Int32(w), height: Int32(h)))
            print(wrapper.augmented(bitmap, width: Int32(w), height: Int32(h)))
            print(wrapper.json())
            print(wrapper.isFinished())

            do {
                let augmented = wrapper.augmented(bitmap, width: Int32(w), height: Int32(h))
                let augmentedImage = UIImage(bitmap: augmented, width: w, height: h)!
                print(augmentedImage)
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

