(defun replace-dot-by-ellipsis (s)
  (let ((pos 0)(len 0)(ans))
    (loop for c across s do
          (if (char= c #\.)
            (setf len (+ len 3))
            (setf len (+ len 1))
          )
    )
    (setf ans (make-string len 
       :element-type 'character))
    (loop for c across s do
          (if (char= c #\.)
            (progn
             (setf (char ans pos) #\.)
             (incf pos)
             (setf (char ans pos) #\.)
             (incf pos)
            )
          )
          (setf (aref ans pos) c)
          (incf pos)
    )
    ans 
  )
)

(print (replace-dot-by-ellipsis '"ab..."))
(print (replace-dot-by-ellipsis "Звенел булат. Картечь визжала."))