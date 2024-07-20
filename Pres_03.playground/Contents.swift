import UIKit

var greeting = "Hello, playground"

// Process steps
// 1. เรียกใช้ AutoComplete โดยส่ง parameter ตามตัวอย่าง function จะทำการแปลงข้อมูลต่าง ๆ เป็น lowercased เพื่อใช้ compair data
// 2. เรียกใช้ method filter ของ array (arr) เพื่อข้อมูลที่มีคำตามที่ต้องการ
// 3. เรียกใช้ method sorted เพื่อเรียงลำดับของข้อมูลที่ได้รับผ่าน method filter
// 4. function SetPriority ที่ถูกเรียกใช้ผ่าน closure ของ sorted จะทำการเรียงลำดับของข้อมูลตามความสำคัญของคำค้นหา (prefix, contains, suffix)
// 5. เรียกใช้ method prefix เพื่อระบุจำนวน length ของ array ที่ต้องการ return กลับไปยังต้นทาง

func AutoComplete(_ prex: String, _ arr: [String], _ length: Int) -> Any {
    let filt = prex.lowercased()
    let sortArr = arr
        .filter { $0.lowercased().contains(filt) }
        .sorted { SetPriority($0, filt) < SetPriority($1, filt) }
        .prefix(length)
    
    
    return sortArr
}

func SetPriority(_ item: String, _ filt: String) -> Int {
    let lower = item.lowercased()
    var index = 4
    
    if lower.hasPrefix(filt) {
        index = 1
    } else if lower.contains(filt) {
        index = 2
    } else if lower.hasSuffix(filt) {
        index = 3
    }
    
    return index
}


let prex = "th"
//let arr = ["TH19", "SG20", "TH2", "TH3Netfix", "TH7", "TESTTH"]
let arr = ["Mother", "Think", "Worthy", "Apple", "Android"]
let length = 3

print(AutoComplete(prex, arr, length))
