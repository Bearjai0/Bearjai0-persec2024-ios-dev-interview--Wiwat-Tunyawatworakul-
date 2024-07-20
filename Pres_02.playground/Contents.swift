import UIKit

var greeting = "Hello, playground"

// Process steps
// 1. function CompairData สำหรับตรวจสอบเรียงข้อมูลรูปแบบตัวเลขและตัวอักษรโดยเรียกใช้ผ่าน closure ของ method sorted
// 2. หลักการทำงานคือ ทุกครั้งที่มีการเรียกใช้ CompairData จะทำการเปรียบเทียบค่าระหว่าง A กับ B โดยจะส่งทั้งสองไปยัง function PresufValid
// 3. PresufValid จะทำการรับค่า String เข้ามาและ Return (String, Int) กลับไป
// 4. หลักการทำงานของ PresufValid คือ เมื่อรับค่าเข้ามาแล้ว จะทำการแยก String ออกเป็นตัวเลขและตัวหนังสือ (เงื่อนไขคือหากเจอตัวหนังสือแล้วจะไม่เก็บข้อมูลซ้ำ)
// 5. เมื่อแยกข้อมูลครบแล้ว จะส่งทั้งสองค่ากลับไปยัง CompairData
// 6. เมื่อ CompairData ได้รับค่ามาแล้วจะทำการตรวจสอบ แบ่งออกเป็น 3 เงื่อนไขคือ
    // 6.1 หาก Letter ระหว่าง A และ B เป็นค่าเดียวกัน จะเข้าเงื่อนไขการจัดลำดับ และไปเช็คลำดับที่ตัวเลขแทน
    // 6.2 หาก เข้าเงื่อนไข 6.1 จะทำการตรวจสอบ Number ระหว่าง A และ B และ Return เงื่อนไขการเรียงลำดับกลับไปยัง method ต้นทาง
    // 6.3 หาก ไม่เข้าเงื่อนไข 6.1 จะทำการตรวจสอบและเรียงลำดับข้อมูลตาม Letter ของ input แทน

func PresufValid(_ str: String) -> (String, Int) {
    //let text = str.prefix { $0.isLetter }
    //let numb = str.suffix { $0.isNumber }
    var text = ""
    var numb = ""
    var numValid = false
    for chr in str {
        if chr.isLetter {
            if numValid { break; }
            text.append(chr)
        } else if chr.isNumber {
            numValid = true
            numb.append(chr)
        }
    }
    
    return (text, Int(numb) ?? 0)
}

func CompairData(_ a: String, _ b: String) -> Bool {
    let (text1, numb1) = PresufValid(a)
    let (text2, numb2) = PresufValid(b)
    
    if text1 == text2 {
        return numb1 < numb2
    }else{
        return text1 < text2
    }
}



let data = ["TH19", "SG20", "TH2"]
let data2 = ["TH10", "TH3Netfix", "TH1", "TH7"]

print(data.sorted { CompairData($0, $1) })
print(data2.sorted { CompairData($0, $1) })
