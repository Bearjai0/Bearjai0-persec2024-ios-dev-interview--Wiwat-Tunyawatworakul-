import UIKit

var greeting = "Hello, playground"

// Process steps
// 1. function SortDesc รับ input integer
// 2. แปลง input เป็น string แล้วนำไปแปลงเป็น character array
// 3. sort array desc แล้วคืนค่าไปยังต้นทาง

func SortDesc(_ s: Int) -> Any {
    var cast = String(s)
    var charr = Array(cast)
    var rv = charr.sorted(by: >)
//    var total = ""
//
//    for txt in rv {
//        total += String(txt)
//    }
    var conv = String(rv)
    
    return conv
}

SortDesc(3008)
SortDesc(1909)
SortDesc(2679)
SortDesc(9163)
