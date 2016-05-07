# Swift03 小费计算器


## 实现功能

- 使用 Property Observer (didset) 监控变量数字变化
- 在数字键盘上添加 done 按钮
- 使用 UITextFieldDelegate 来判断用户输入的是否为合法数字，如否，不允许继续输入
- 使用 MVC 架构（引入 Tip Model 计算小费）
- 使用 Slider 控制小费比例，在 sliderChange 中处理变化事件


## 预览

![Preview](https://raw.githubusercontent.com/shinwood/Swift03-tip-calculator/master/03-tip-calculator.gif)

## 更多阅读：

### 数字输入/输出　

- http://swifter.tips/output-format/


- http://www.dotnetperls.com/math-swift


- http://www.globalnerdy.com/2015/04/27/how-to-program-an-ios-text-field-that-takes-only-numeric-input-or-specific-characters-with-a-maximum-length/

### UISlider 用法

- http://my.oschina.net/wangyongtao/blog/517341

- https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/UIKitUICatalog/UISlider.html

- https://developer.apple.com/library/ios/documentation/UIKit/Reference/UISlider_Class/index.html

### 数字键盘添加 Done 按键

- ​http://iostechsolutions.blogspot.jp/2014/11/swift-add-uitoolbar-or-done-button-on.html


*Inspired by http://samvlu.com/*