import { window } from '@kit.ArkUI';

/*
 * class 类名 {
 *  字段名: 类型 = 初始值
 *  字段名?: 类型
 * }
 * 和js一样
 * */
class Cat {
  //1. 实例属性
  protected name: string // 可以给子类访问和子类访问，但是实例不能
  foods?: string // 可选
  readonly price: number // 只读修饰符
  private age: number = 0; // 私有修饰符, 只能自己访问


  // 静态属性和方法只能类来访问
  static version: string = 'v11.11'
  static getRandom(): string {
    return Cat.version
  }

  // 构造函数
  constructor(name: string, price: number) {
    this.name = name
    this.price = price
  }

  sayHi(name: string) {
    console.log(`hi， ${name}, ${this.name}`)
  }
}
// 使用类 实例化对象 基于类 创建对象
let c: Cat = new Cat('Jerry', 20)
// console.log(c.name)
c.foods = 'fish'
c.sayHi('Tom')
console.log('版本:', Cat.getRandom())
console.log('食物:', c.foods?.length)

// extends继承
class Person extends Cat {
  sayHi(name: string): void {
    // super访问父类属性和方法
    console.log(`我是${super.name}的子类${name}`)
  }
}
let p: Person = new Person('pp', 10)
// 判断复杂类型
console.log('判断结果：', p instanceof Cat)
// 判断数组是否为Array的实例
let arr = []
console.log('判断结果：', arr instanceof Array)



@Entry
@Component
struct Index {

  windowClass?: window.Window

  // 如何解决DevEco预览器上下白色间距问题及实现全屏沉浸式体验, 可以通过调用鸿蒙的API来修复这个问题
  // this.windowClass.setWindowLayoutFullScreen(true) 这段代码会在页面加载时获取最后一个窗口并将其设为全屏模式，从而消除上下白色间距。
  async setFullScreen(flag: boolean) {
    if (!this.windowClass) {
      this.windowClass = await window.getLastWindow(getContext(this))
    }
    this.windowClass.setWindowLayoutFullScreen(flag)
  }

  onPageShow(): void {
    this.setFullScreen(true)
  }

  onPageHide(): void {
    this.setFullScreen(false)
  }

  build() {

  }

}