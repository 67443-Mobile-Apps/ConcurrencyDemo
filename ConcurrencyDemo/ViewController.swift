//  ViewController.swift
//  ConcurrencyDemo
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var primeNumberButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func calculatePrimeNumbers(_ sender: Any) {
    // calculatePrimes()
    
    // DispatchQueue.main.async {
    //   self.calculatePrimes()
    // }
    
    DispatchQueue.global(qos: .default).async {
      self.calculatePrimes()
    }

  }
  
  // MARK: Calculating Primes
  // These methods are just so we can spend a lot of time tying up the interface
  func isPrime(number: Int) -> Bool {
    if number <= 1 {
      return false
    }
    if number <= 3 {
      return true
    }
    var i = 2
    while i * i <= number {
      if number % i == 0 {
        return false
      }
      i = i + 2
    }
    return true
  }
  
  func calculatePrimes() {
    for number in 0...100_000_000 {
      let isPrimeNumber = isPrime(number: number)
      print("\(number) is prime: \(isPrimeNumber)")
    }
  }

}

