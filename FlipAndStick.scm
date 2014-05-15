; This script takes a set of layers and apppends a flipped copy of the layers to a copy of the layers, producing a longer looped animation from any animation.
; Note: This script unoptimizes, adds the frames then optimizes the resulting image so, if your animation replaces the whole frame each time or even part of 
; the time then you may want to run Unoptimize on the output.

 (define (script-fu-flip-and-stick inImage )
 (let*
    (
		(theImage (car
						(plug-in-animationunoptimize
						 RUN-NONINTERACTIVE
						 inImage
						 inImage
						)
					)
		)
		
		(layers (gimp-image-get-layers theImage))
        (num-layers (car layers))
        (layer-array (cadr layers))
		(i 0)
		(final-layers (* num-layers 2))
		
		(tempLayer ;initialize to type layer, there's probably a better way
				(gimp-layer-new-from-drawable
						(aref layer-array i)
						theImage
				)
		)
	)


	    (while (< i final-layers)
			(set! layer-array (cadr (gimp-image-get-layers theImage)))
			(set! tempLayer 
				(car
					(gimp-layer-new-from-drawable
						(aref layer-array i)
						theImage
					)
				)
			)
			(gimp-item-set-name tempLayer (string-append "Frame " (number->string (+ num-layers (/ i 2)))))
			(gimp-image-insert-layer theImage tempLayer 0 -1)
           (set! i (+ i 2))
         )
	

	(gimp-display-new 
					(car
						(plug-in-animationoptimize
						 RUN-NONINTERACTIVE
						 theImage
						 theImage
						)
					)
	)
 )
)
 
 
  (script-fu-register
    "script-fu-flip-and-stick"                        ;func name
    "Flip-and-Stick"                                  ;menu label
    "This script takes a set of layers and apppends a flipped copy of the layers to a copy of the layers, producing a longer looped animation from any animation."              		;description
    "Ryan Wiedemann"                            ;author
    "released under wtfpl 2014"        ;copyright notice
    "April 17, 2014"                          ;date created
    "*"                     ;image type that the script works on
    SF-IMAGE      "Image"          0   ;an image
	SF-DRAWABLE   "Drawable"       0
  )
 
  (script-fu-menu-register "script-fu-flip-and-stick" "<Image>/Filters/Animation/")
  
 ; This script was created in 2014 by Ryan Wiedemann.
