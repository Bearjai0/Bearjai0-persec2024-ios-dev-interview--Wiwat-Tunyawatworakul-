import UIKit

var greeting = "Hello, playground"

// Process steps
// 1. function Trib รับค่า sequence สำหรับข้อมูลชุดแรก และ length เพื่อระบุจำนวนของข้อมูลที่ต้องการ
// 2. ทำการ loop เพื่อตรวจสอบค่าใน array เงื่อนไขคือจำนวนของ sequence ต้องทำงานไม่เกินจำนวนที่ต้องการ (length)
// 3. ในกรณีที่มีการทำงานของ loop ให้ทำการ เช็คข้อมูลที่จะนำมาต่อท้ายข้อมูลชุดแรก (sequence) โดยใช้ method suffix เพื่อรวมค่า value 3 index สุดท้ายของ result (ประกาศมาเพื่อรับค่าจาก sequence)
// 4. ใช้ method reduce เพื่อบวกค่าที่ได้จาก method suffix กลับไปยังตัวแปร nextValue
// 5. push ค่าที่ได้มาที่ตัวแปร nextValue ไปยัง result และเมื่อครบรอบการทำงานตามจำนวนของข้อมูลที่ต้องการ (length) แล้วให้ return ค่ากลับไปยังต้นทาง

func Trib(sequence: [Int], length: Int) -> [Int]{
    var result = sequence
    
    while (result.count < length) {
        let nextValue = result.suffix(3).reduce(0, +)
        result.append(nextValue)
    }
    
    return result
}


Trib(sequence: [1,3,5], length: 5)
Trib(sequence: [2,2,2], length: 3)
Trib(sequence: [10,10,10], length: 4)
