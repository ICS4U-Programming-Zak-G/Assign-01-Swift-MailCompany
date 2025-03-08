//
//  MailCompany.swift
//
//  Created by Zak Goneau
//  Created on 2025-03-07
//  Version 1.0
//  Copyright (c) 2025 Zak Goneau. All rights reserved.
//
//  Check if a package is valid in size and weight.

// Import library
import Foundation

// Declare constants
let MAX_WEIGHT = 27.0
let MAX_SIZE = 10000.0
let MIN_MEASURE = 1
let MAX_MEASURE = 35
let MIN_WEIGHT = 1
let MAX_WEIGHT_LIMIT = 50

// Define function to calculate volume
func calculateVolume(width: Double, height: Double, length: Double) -> Double {

    // Return volume
    return width * height * length
}

// Define function to calculate bonus package result
func calculateBonusResult(width: Double, height: Double, length: Double) -> Double {

    // Return volume of bonus package
    return width * height * length
}

// Define main function
func main() {

    // Initialize answer
    var answer: String = ""

    // Introduce program to user
    print("This is a mail company! We only take certain packages based on weight and size.")

    // Repeat...While loop
    repeat {
        // Generate random values for bonus package
        let bonusPackageLength = Double(Int.random(in: MIN_MEASURE...MAX_MEASURE))
        let bonusPackageWidth = Double(Int.random(in: MIN_MEASURE...MAX_MEASURE))
        let bonusPackageHeight = Double(Int.random(in: MIN_MEASURE...MAX_MEASURE))
        let bonusPackageWeight = Double(Int.random(in: MIN_WEIGHT...MAX_WEIGHT_LIMIT))

        // Get user input for weight
        print("Please enter a weight (kg):")

        // Check if input is valid and assign to variable
        guard let weightString = readLine(), let weight = Double(weightString), weight >= 0 else {

            // Tell user invalid input if failed conversion
            print("Invalid weight. It must be a positive number.")

            // Continue loop
            continue
        }

        // Check if weight is over limit
        if weight > MAX_WEIGHT {

            // Tell user weight is too high
            print("\(weight) kg is over \(MAX_WEIGHT) kg.")

            // Continue loop
            continue
        }

        // Get user input for size
        print("Please enter a width (cm):")

        // Check if input is valid and assign to variable
        guard let widthString = readLine(), let width = Double(widthString), width >= 0 else {

            // Tell user invalid input if failed conversion
            print("Invalid width. It must be a positive number.")

            // Continue loop
            continue
        }

        // Get user input for size
        print("Please enter a length (cm):")

        // Check if input is valid and assign to variable
        guard let lengthString = readLine(), let length = Double(lengthString), length >= 0 else {

            // Tell user invalid input if failed conversion
            print("Invalid length. It must be a positive number.")

            // Continue loop
            continue
        }

        // Get user input for size
        print("Please enter a height (cm):")

        //  Check if input is valid and assign to variable
        guard let heightString = readLine(), let height = Double(heightString), height >= 0 else {

            // Tell user invalid input if failed conversion
            print("Invalid height. It must be a positive number.")

            // Continue loop
            continue
        }

        // Call function to calculate volume
        let volumeResult = calculateVolume(width: width, height: height, length: length)

        // Check if volume is too big
        if volumeResult > MAX_SIZE {

            // Tell user package is too big
            print("Package is too big.")

        // Otherwise check if weight is too heavy
        } else {

            // Call function to calculate bonus package volume
            let bonusPackageResult = calculateBonusResult(width: bonusPackageWidth, height: bonusPackageHeight, length: bonusPackageLength)

            // Print results
            print("The volume of a package with a width of \(width)cm, height of \(height)cm, length of \(length)cm is \(String(format: "%.2f", volumeResult)) cm^3")

            // Check if bonus package is too heavy or big
            if bonusPackageWeight > MAX_WEIGHT {

                // Tell user bonus package is too heavy
                print("You got an extra package of \(bonusPackageWeight)kg but it's too heavy.")

            // Check if bonus package is too big
            } else if bonusPackageResult > MAX_SIZE {

                // Tell user bonus package is too big
                print("You got an extra package of \(bonusPackageResult) cm^3 but it's too big.")

            // Otherwise bonus package is valid
            } else {

                // Tell user bonus package is valid
                print("You got an extra package of \(bonusPackageWeight)kg and \(bonusPackageResult) cm^3 and it's valid!")
            }

            // Ask if they want to play again
            print("Would you like to continue? (q to quit):")
            answer = readLine() ?? ""
        }

    // Continue loop until user quits
    } while answer.lowercased() != "q"

    // Thank user for playing
    print("Thank you for playing!")
}

// Run the main function
main()
