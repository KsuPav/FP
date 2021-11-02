(defclass cart ()                ; имя класса и надклассы
 ((x :initarg :x :reader cart-x)   ; дескриптор слота x
  (y :initarg :y :reader cart-y))) ; дескриптор слота y
(defclass polar ()
 ((radius :initarg :radius :accessor radius) 	; длина >=0
  (angle  :initarg :angle  :accessor angle)))	; угол (-π;π]

(defclass line ()
 ((start :initarg :start :accessor line-start)
  (end   :initarg :end   :accessor line-end)))

(defun line-length (l)
  (let ((x1 (cart-x (line-start l)))
        (y1 (cart-y (line-start l)))
        (x2 (* (radius (line-end l)) (cos (angle(line-end l)))))
        (y2 (* (radius (line-end l)) (sin (angle(line-end l)))))
       )
    (sqrt (+ (expt (- x1 x2) 2) (expt (- y1 y2) 2)))
  )
)

(setq lin1 (make-instance 'line
           :start (make-instance 'cart :x 0 :y 2)
           :end (make-instance 'polar :radius 5 :angle (/ pi 2))))

(setq lin2 (make-instance 'line
           :start (make-instance 'cart :x 1 :y 1)
           :end (make-instance 'polar :radius 5 :angle (/ pi 4))))

(setq lin3 (make-instance 'line
           :start (make-instance 'cart :x 0 :y 1)
           :end (make-instance 'polar :radius 1 :angle (/ pi 2))))

(print (line-length lin1))
(print (line-length lin2))
(print (line-length lin3))

