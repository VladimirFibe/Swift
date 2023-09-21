#  UIPageControl

![](img/01.png)

```
    private var pageControl: UIPageControl = {
        let pageControl = UIPageControl(frame: .zero)
        pageControl.numberOfPages = 3
        pageControl.currentPageIndicatorTintColor = AppColor.blueColor.uiColor
        pageControl.pageIndicatorTintColor = UIColor.lightGray.withAlphaComponent(0.8)
        return pageControl
    }()
```
