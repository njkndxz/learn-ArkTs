// 变量声明，和ts一样
let title: string = '标题'
let num: number = 20
num = 50
let flag: boolean = true
const hi: string = '你好'

// 数组操作和js一样
const list: string[] = ['11', '22', '33']
list[0] = 'aa'
let arr: string[] = ['aa', 'bb', 'cc']
arr.push(list[0])
// arr.pop()
arr.unshift('ee')
// arr.shift()
// 参数二为0或大于0表示要不要删除元素，大于0是删，0是不删
arr.splice(1, 0, 'ff')
console.log(title, num, flag, hi)

//可选的数据范围
let gender: 'man' | 'woman' = 'man'

function func(title: string[]) {
  for (let index = 0; index < title.length; index++) {
    const element = title[index]
    console.info(element)
  }
}
func(arr)

const arrowFunc = (price: number, num: number) => {
  return price * num
}
console.info(String(arrowFunc(1, 2)))

interface Person {
  // 联合类型
  name: string | number
  age: number
  weight?: number
  sing: () => void
  // 方法不能是可选的
  dance: (song?: string) => void
}

const p: Person = {
  name: 'aa',
  age: 20,
  weight: 90,
  sing: () => {
    console.info('啦啦啦')
  },
  dance: (song: string = 'faded') => {
    console.info(song)
  }
}
// 不支持这种格式 p['age'] = 20
p.name = 'bb'
p.sing()
p.dance('That Girl')

// 枚举
enum Color {
  Red = 'red',
  Blue = 'blue'
}
// 只能从枚举里面取值
const col: Color = Color.Blue


