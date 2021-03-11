//
//  ViewController.swift
//  matrixMediaSoft
//
//  Created by Alexander Nazarov on 11.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let matrixA = myMatrix()
        let matrixB = myMatrix()
        let matrixM = matrixMultiply(matrixA, matrixB)
        for i in matrixM {
            DispatchQueue.main.async {
                print(i)
            }
        }
    }
    
    
    func matrixMultiply(_ matrixA: [[Int]], _ matrixB: [[Int]]) -> [[Int]] {
        let size = matrixA.count
        var result: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: size), count: size)
        print("Matrix completed")
        for i in 0..<result.count {
            let queueOne = DispatchQueue.global()
            queueOne.sync {
                for j in 0..<matrixA.count {
                    let queueTwo = DispatchQueue.global()
                    queueTwo.sync {
                        for k in 0..<matrixB.count{
                            result[i][j] += matrixA[i][k] * matrixB[k][j]
                        }
                    }
                }
            }
        }
        return result
    }
    
    
    func myMatrix() -> [[Int]] {
        var matrix: [[Int]] = []
        for i in 0..<10 {
            matrix.append([Int(arc4random_uniform(4))])
            for _ in 0..<10 {
                matrix[i].append(contentsOf: [Int(arc4random_uniform(4))])
            }
        }
        return matrix
    }
}



