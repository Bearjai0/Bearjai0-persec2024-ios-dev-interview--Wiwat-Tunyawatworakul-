import UIKit

var greeting = "Hello, playground"

//Process steps
// 1. ประกาศตัวแปร symbol เพื่อเก็บข้อมูลระหว่างเลขโรมัน กับเลขอารบิก (ที่ต้องประกาศเพิ่มจะมี 900, 400, 90, 40, 9, 4) เพื่อไม่ให้จำนวนตัวเลขเดียวกันซ้ำกันเกิน 3 หลัก
// 2. function ConvertRomn สำหรับแปลงเลขอารบิกเป็นเลขโรมัน และ function ConvertNumb สำหรับแปลงเลขโรมันเป็นเลขอารบิก
// 3. function ConvertRomn
    // 3.1 หลักการทำงานคือนำตัวแปร symbol มา loop เพื่อไล่จำนวนตัวเลขที่ได้มีการกำหนดไว้ กำหนดเป็น value = ค่าเลขอารบิก, symb = ค่าเลขโรมัน
    // 3.2 ทุกครั้งที่ loop symbol จะทำการเช็คว่าค่าของ input มีมากกว่า value ณ รอบนั้นๆ หรือไม่ หากยังมีค่ามากกว่า ให้ทำการ + value เข้าไปใน result และทำการลดค่าของ input ลง
    // 3.3 ฟังก์ชั่นจะ loop จนกว่าค่าของ input จะลดลงจนหมด (loop ตัวแปร symbol จนครบต่อให้ได้ค่าครบแล้วก็ตาม)
    // 3.4 หาก input ค่าเหลือ 0 ระบบจะหยุดและ return ค่าไปยังต้นทาง
// 4. function ConvertNumb
    // 4.1 หลักการทำงานคือรับค่า String ของเลขโรมันเข้ามา แล้วแปลงเป็น Character array แล้วทำการ loop ให้ครบตามลำดับ
    // 4.2 ใช้ str.reversed() เพื่อทำการ reverse ข้อมูลใน array ให้ทำการบวกจาก value ที่น้อยที่สุดก่อนเนื่องจากหลักการบวกหากเลขน้อยอยู่ด้านซ้ายและลบเมื่อเลขมากกว่าอยู่ด้านขวา ของเลขโรมัน จะทำให้ result ที่นำมาเช็ค (index < prev) จะทำให้ได้ข้อมูลที่ไม่ถูกต้อง
    // 4.3 ทุกครั้งที่ loop จะนำ symbol มา loop ด้วยทุกครั้งเพื่อเช็คเลข value ของ array ว่าตรงกับค่าอะไรแล้วทำการดึง index มาใช้
    // 4.4 ตัวแปร prev ใช้สำหรับเก็บค่าของเลขอารบิก เพื่อเช็คว่ามีการเปลี่ยนหลักของข้อมูลรึยัง (10, 100, 1000) ตามหลักการของเลข Roman ที่จะต้องลดค่าในกรณีที่เลขด้านซ้ายมีค่ามากกว่า แต่ต้องใช้สลับด้านเนื่องจากการสลับของข้อมูล ( str.reversed() ) (prev = ค่าที่เกิดจากรอบก่อนหน้า default = 0, index = ค่าของรอบปัจจุบัน)

let symbol: [Int: String] = [1000: "M", 900: "CM", 500: "D", 400: "CD", 100: "C", 90: "XC", 50: "L", 40: "XL", 10: "X", 9: "IX", 5: "V", 4: "IV", 1: "I"]

func ConvertRomn(_ num: Int) -> String {
    var val = num
    var result = ""
    
    for (value, symb) in symbol.sorted(by: >) {
        while (val >= value){
            result += symb
            val -= value
        }
        
        if val == 0 {
            break;
        }
    }
    
    return result
}

func ConvertNumb(_ str: String) -> Int {
    var result = 0
    var prev = 0
    
    for chr in Array(str.reversed()) {
        for (index, item) in symbol {
            if (String(chr) == item) {
                if (index < prev) {
                    result -= index
                } else {
                    result += index
                    prev = index
                }
                
//                print("Index = \(index), prev = \(prev), result = \(result)")
            }
        }
    }
    
    return result
}


ConvertNumb("MCMLXXXIX")

ConvertRomn(1989)
ConvertRomn(2000)
ConvertRomn(68)
ConvertRomn(109)
