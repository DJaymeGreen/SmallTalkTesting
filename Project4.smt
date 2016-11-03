;;;D Jayme Green
;;;uSmallTalk project with Shapes

;Shape Class 
;Has Perimeter and Area with getters and setters
(class Shape Object
	(Perimeter Area)
	(class-method shapeConstructor: (dumb)
		(setInitialShape:: (new self) 3 5)
	)
	(method setInitialShape:: (perim area)
		(set Perimeter perim)
		(set Area area)
		self)
	(method getPerimeter () Perimeter)
	(method getArea () Area)
	(method setPerimeter: (newPerim)
		(set Perimeter newPerim)
	)
	(method setArea: (newArea)
		(set Area newArea)
	)
)

;Circle Class (inherits from Shape)
;Has a radius, perimeter, and area with getters and setters
(class Circle Shape
	(Radius Pie)
	(class-method circleConstructor: (radius)
		(setInitialCircle: (shapeConstructor: super radius) radius))
	(method setInitialCircle: (radius)
		(set Radius radius)
		;(set Pie (asFloat (/ 314 100)))
		(set Pie 314)
		;self
		(setPerimCircle: self (asInteger(/(*(* 2 radius) Pie) 100)))
		(setAreaCircle: self (asInteger(/(*(* radius radius) Pie) 100)))
		self)
	(method getRadius () Radius)
	(method setRadius: (newRadius)
		(set Radius newRadius)
		(setPerimCircle: self (asInteger(/(*(* 2 newRadius) Pie) 100)))
		(setAreaCircle: self (asInteger(/(*(* newRadius newRadius) Pie) 100))))
	(method setPerimCircle: (newPerim)
		(setPerimeter: self newPerim))
	(method setAreaCircle: (newArea)
		(setArea: self newArea)))
;
;Rectangle Class (inherits from Shape)
;Has a Length, Width, Perimeter, and Area with getters and setters
(class Rectangle Shape
	(Length Width)
	(method setInitialRectangle:: (len wid)
		(set Length len)
		(set Width wid)
		(updateAreaAndPerimRec self)
		self
	)
	(method updateAreaAndPerimRec ()
		(setPerimeter: self (* 2 (+ Length Width)))
		(setArea: self (* Length Width))
	)
	(method getWidth () Width)
	(method getLength () Length)
	(method setWidth: (wid)
		(set Width wid)
		(updateAreaAndPerimRec self)
	)
	(method setLength: (len)
		(set Length len)
		(updateAreaAndPerimRec self)
	)
	(class-method rectangleConstructor:: (len wid)
		(setInitialRectangle:: (shapeConstructor: super len) len wid)
	)
)

;Square Class (inherits from Rectangle)
;Has a Side, Perimeter, and Area with getters and setters
(class Square Rectangle
	(Side)
	(method setInitialSquare: (side)
		(set Side side)
		(updateAreaAndPerimSquare self)
		self
	)
	(method updateAreaAndPerimSquare ()
		(setPerimeter: self (* 4 Side))
		(setArea: self (* Side Side))
	)
	(method getSide () Side)
	(method setSide: (side) 
		(set Side side)
		(updateAreaAndPerimSquare self)
	)
	(class-method squareConstructor: (side)
		(setInitialSquare: (rectangleConstructor:: super side side) side)
	)
)

;;Triangle Class (inherits from Shape)
;H;as 3 Sides, a Base, a Height, a Perimeter, and an Area with getters and setters
(class Triangle Shape
	(Side1 Side2 Side3 Base Height)
	(method setInitialTriangle::::: (s1 s2 s3 base height)
		(set Side1 s1)
		(set Side2 s2)
		(set Side3 s3)
		(set Base base)
		(set Height height)
		(updateAreaAndPerimTriangle self)
		self
	)
	(method updateAreaAndPerimTriangle ()
		(setPerimeter: self (+ (+ Side1 Side2)Side3))
		(setArea: self (/ (* Base Height) 2))
	)
	(method getSide1 () Side1)
	(method getSide2 () Side2)
	(method getSide3 () Side3)
	(method getBase () Base)
	(method getHeight() Height)
	(method setSides::: (s1 s2 s3)
		(set Side1 s1)
		(set Side2 s2)
		(set Side3 s3)
		(updateAreaAndPerimTriangle self)
	)
	(method setBaseHeight:: (base height)
		(set Base base)
		(set Height height)
		(updateAreaAndPerimTriangle self)
	)
	(class-method triangleConstructor::::: (s1 s2 s3 base height)
		(setInitialTriangle::::: (shapeConstructor: super s1) s1 s2 s3 base height)
	)
)

;Shape Class Tests, Should print 3, 5, 5, 10 (not including "set" prints)
(val shape (shapeConstructor: Shape 1))
(getPerimeter shape)
(getArea shape)
(setPerimeter: shape 5)
(setArea: shape 10)
(getPerimeter shape)
(getArea shape)

;Circle Class Tests, Should print 30,75,2,6,6,5,10,10 (not including "set" prints)
;(use Project4.smt)
(val circle (circleConstructor: Circle 5))
(getPerimeter circle)
(getArea circle)
(setRadius: circle 2)
(getRadius circle)
(getPerimeter circle)
(getArea circle)
(setPerimCircle: circle 5)
(getPerimeter circle)
(setPerimeter: circle 10)
(setAreaCircle: circle 10)
(getArea circle)

;Rectangle Class Tests, Should print 10,6,3,2,14,10,30,50,10,2,3 (not including "set" prints)
(val rec (rectangleConstructor:: Rectangle 2 3))
(getPerimeter rec)
(getArea rec)
(getWidth rec)
(getLength rec)
(setWidth: rec 5)
(getPerimeter rec)
(getArea rec)
(setLength: rec 10)
(getPerimeter rec)
(getArea rec)
(getLength rec)
(setPerimeter: rec 2)
(getPerimeter rec)
(setArea: rec 3)
(getArea rec)

;Square Class Tests, Should print 12,9,3,8,4,10,20 (not including "set" prints)
(val sq (squareConstructor: Square 3))
(getPerimeter sq)
(getArea sq)
(getSide sq)
(setSide: sq 2)
(getPerimeter sq)
(getArea sq)
(setPerimeter: sq 10)
(setArea: sq 20)
(getPerimeter sq)
(getArea sq)

;Triangle Class Tests, Should print 6,10,2,3,4,9,110,2,3,3,10,20 (not including "set" prints)
(val tri (triangleConstructor::::: Triangle 1 2 3 4 5))
(getPerimeter tri)
(getArea tri)
(setSides::: tri 2 3 4)
(getSide1 tri)
(getSide2 tri)
(getSide3 tri)
(getPerimeter tri)
(getArea tri)
(setBaseHeight:: tri 2 3)
(getBase tri)
(getHeight tri)
(getArea tri)
(setPerimeter: tri 10)
(setArea: tri 20)
(getPerimeter tri)
(getArea tri)
