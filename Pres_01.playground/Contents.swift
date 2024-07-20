import UIKit

var greeting = "Hello, playground"

// Process steps
// 1. comp สำหรับเทียบข้อมูลที่ input เข้ามาใน function ว่าพบข้อมูลสำหรับการเปิดวงเล็บหรือไม่
// 2. arr ใช้เก็บข้อมูลในกรณีที่นำ input มาเทียบ index แล้วเจอ value แสดงว่ามีการเปิดวงเล็บจริง
// 3. val ค่าที่ input มา convert เป็น character array แล้วนำแต่ละตัวมาเปรียบเทียบกับค่าใน comp
// 4. if แรกสำหรับเช็คว่า comp ในตำแหน่งที่ val(character จาก input) มีข้อมูลจริงหรือไม่ ถ้ามีให้มีการ push ข้อมูลลง arr
// 5. ในกรณีลง else if แสดงว่าไม่พบข้อมูลใน comp ซึ่งตีความว่าอาจจะเป็นข้อมูลอื่น หรือเป็นวงเล็บปิด จึงนำตัวแปร lst มาเก็บค่า value สุดท้ายของ arr( index ของ comp ที่บันทึกลงไปล่าสุด)
// 6. เช็คว่า value ของ comp ในตำแหน่ง lst มีค่าตรงกับ character จาก input หรือไม่ ถ้าตรงกันแสดงว่าเป็นวงเล็บปิดของการเปิดวงเล็บล่าสุด
// 7. หากข้อ 6 = true ให้ลบ last index ของ arr ออกถือเป็นการจบการ match วงเว็บในแต่ละครั้ง

func checkValidMatching(param: String) -> Bool {
    var arr = [Character]()
    let comp: [Character: Character] = ["(": ")", "[": "]", "{": "}"]
    
    for val in param {
        if let cur = comp[val] {
            arr.append(val)
        } else if let lst = arr.last, comp[lst] == val {
            arr.popLast()
        } else {
            return false
        }
    }
    
    return arr.isEmpty
}



let datas = ["()", "([]", "([])", "([[]]]", ")", "(])])", "([)]", "(", "XX", "{[]}"]
for index in datas {
    print(checkValidMatching(param: index))
}
