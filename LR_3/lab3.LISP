(defun swap-rows (A i j)
  (let* ((nrows (array-dimension A 0))
         (ncols (array-dimension A 1))
         (C (make-array (list nrows ncols)))
        )
    (loop for x from 0 to (- nrows 1) do
          (loop for y from 0 to (- ncols 1) do
                (setf (aref C x y) (aref A x y))
          )
    )
    (loop for y from 0 to (- ncols 1) do
          (let ((tempa (aref C i y))
                (tempb (aref C j y)))
            (setf (aref C i y) tempb)
            (setf (aref C j y) tempa)
          )
    )
    C
  )
)

(defun print-matrix (matrix &optional (chars 3) stream)
  (let ((*print-right-margin* (+ 6 (* (1+ chars)
                                      (array-dimension matrix 1)))))
    (pprint matrix stream)
    (values)))


(setq ga (make-array '(5 4)
 :initial-contents '((1  2  3  4 )
                     (5  6  7  8 )
                     (9  10 11 12)
                     (13 14 15 16)
                     (17 18 19 20))))

(print-matrix (swap-rows ga 0 1))
(print-matrix (swap-rows ga 1 2))
(print-matrix (swap-rows ga 0 4))
(print-matrix ga)