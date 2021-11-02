(defun product-sum3 (a)
    (product-sum3-opt a 0 (- (length a) 1))
)

(defun product-sum3-opt (a i j)
  (if (> j 1) (* (product-sum3-opt a (+ i 1)(- j 1))
    (+ (nth i a)(nth (+ i 1) a)(* 2 (nth j a))))
    (+ (nth i a)(nth (+ i 1) a)(* 2 (nth j a))))
)

(print(product-sum3 '(1 2 3)))
(print(product-sum3 '(1 2 3 4 5)))
(print(product-sum3 '(1 2 3 4 5 6)))