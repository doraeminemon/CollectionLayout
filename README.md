<img src="Image/screenshot.png" width="375">

# CollectionLayout

As the norm of apps nowadays is actually a scrollView rather a view, the default system of Apple to build a view using .xib and AutoLayout has rather become clunky and low performance. Furthermore, the manual way of building layout has proven to be a problem when it comes to process require fast iteration and less error-prone ( mostly due to communication between designer-developer ).

Inspired by this talk about [backend-driven native UIs](https://www.facebook.com/atscaleevents/videos/1708052886134475/) by [John Sundell](https://github.com/JohnSundell), I'm trying to recreate a system of my own by following his words : using a collection view in order to allow a block-based view creation, allow for a higher performance and easier to use layout design option.

However I did some improvement of my own, such as abstracting away the view layout logic into a protocol, allowing Views to layout subview in a similar way a collectionView laying out its cells. This allows view component to be nested inside each other, such as StackViewComponent ( allow stacking component ) and ScrollViewComponent ( allow adding views in a scrollView ).

The cells are also current route all the logic ( delegate, datasource ) from the collection cells into the main view controller. Similar component types will need to separate its behavior by tag.

The current state of project is just a proof of concept, rather than a complete implementation.For a more complete layout option, try [Render](https://github.com/alexdrone/Render) by Alexdrone, [Few.swift](https://github.com/joshaber/Few.swift) or [Facebook/Yoga](https://github.com/facebook/yoga)

## Usage

Clone and run the workspace file Example folder.

Further documentation will be added later on, should this library became more mature.

## Further improvement

 - JSON conversion
 - Tests and documentation sample

## Author

Do Son, dodinhthyson@gmail.com

## License

CollectionLayout is available under the MIT license. See the LICENSE file for more info.
