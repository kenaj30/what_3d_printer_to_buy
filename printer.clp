(defrule start
   (and (not (exists
                  (wynik ? $?)))
        (not (exists
                  (pytanie ? $?)))
        (not (exists
                  (odpowiedz ? ?))))
   =>
   (assert (pytanie "The thing I want most is...?" "Ultra High Print Quality" "Moddability" "Ease of Use" "Big Build Volume" "Portability")))

; Ultra High Print Quality
(defrule ultra-high-print-quality
    ?od <- (odpowiedz "The thing I want most is..." "Ultra High Print Quality")
    ?pid <- (pytanie "The thing I want most is..." "Ultra High Print Quality" "Moddability" "Ease of Use" "Big Build Volume" "Portability")
    =>
    (retract ?pid)
    (assert (pytanie "Do you also need affordability?" "Yes" "No")))

; Do you also need affordability? Yes
(defrule affordability-yes-ultra-high-print
    ?od <- (odpowiedz "Do you also need affordability?" "Yes")
    ?pid <- (pytanie "Do you also need affordability?" "Yes" "No")
    =>
    (retract ?pid)
    (assert (pytanie "Do you need dual extrusion?" "Yes" "No")))

; Do you need dual extrusion? Yes
(defrule dual-extrusion-yes
    ?od <- (odpowiedz "Do you need dual extrusion?" "Yes")
    ?pid <- (pytanie "Do you need dual extrusion?" "Yes" "No")
    =>
    (retract ?pid)
    (assert (wynik "Deezmaker Bukobot v2 Duo")))
	
; Do you need dual extrusion? No
(defrule dual-extrusion-no
    ?od <- (odpowiedz "Do you need dual extrusion?" "No")
    ?pid <- (pytanie "Do you need dual extrusion?" "Yes" "No")
    =>
    (retract ?pid)
    (assert (wynik "Deezmaker Bukobot v2")))
	
; Do you also need affordability? No
(defrule affordability-no
    ?od <- (odpowiedz "Do you also need affordability?" "No")
    ?pid <- (pytanie "Do you also need affordability?" "Yes" "No")
    =>
    (retract ?pid)
    (assert (wynik "Ultimaker2")))
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
(defrule start
   (and (not (exists
                  (wynik ? $?)))
        (not (exists
                  (pytanie ? $?)))
        (not (exists
                  (odpowiedz ? ?))))
   =>
   (assert (pytanie "The thing I want most is...?" "Ultra High Print Quality" "Moddability" "Ease of Use" "Big Build Volume" "Portability")))

; Ultra High Print Quality
(defrule ultra-high-print-quality
    ?od <- (odpowiedz "The thing I want most is...?" "Ultra High Print Quality")
    ?pid <- (pytanie "The thing I want most is...?" "Ultra High Print Quality" "Moddability" "Ease of Use" "Big Build Volume" "Portability")
    =>
    (retract ?pid)
    (assert (pytanie "Do you also need affordability?" "Yes" "No")))

; Do you also need affordability? Yes
(defrule affordability-yes-ultra-high-print
    ?od <- (odpowiedz "Do you also need affordability?" "Yes")
    ?pid <- (pytanie "Do you also need affordability?" "Yes" "No")
    =>
    (retract ?pid)
    (assert (pytanie "Do you need dual extrusion?" "Yes" "No")))

; Do you need dual extrusion? Yes
(defrule dual-extrusion-yes-ultra-high-print
    ?od <- (odpowiedz "Do you need dual extrusion?" "Yes")
    ?pid <- (pytanie "Do you need dual extrusion?" "Yes" "No")
    =>
    (retract ?pid)
    (assert (wynik "Deezmaker Bukobot v2 Duo")))
	
; Do you need dual extrusion? No
(defrule dual-extrusion-no-ultra-high-print
    ?od <- (odpowiedz "Do you need dual extrusion?" "No")
    ?pid <- (pytanie "Do you need dual extrusion?" "Yes" "No")
    =>
    (retract ?pid)
    (assert (wynik "Deezmaker Bukobot v2")))
	
; Do you also need affordability? No
(defrule affordability-no-ultra-high-print
    ?od <- (odpowiedz "Do you also need affordability?" "No")
    ?pid <- (pytanie "Do you also need affordability?" "Yes" "No")
    =>
    (retract ?pid)
    (assert (wynik "Ultimaker2")))
	
;;;;;;; branch 2
	
; Moddability
(defrule moddability
    ?od <- (odpowiedz "The thing I want most is...?" "Moddability")
    ?pid <- (pytanie "The thing I want most is...?" "Ultra High Print Quality" "Moddability" "Ease of Use" "Big Build Volume" "Portability")
    =>
    (retract ?pid)
    (assert (pytanie "Do you also need affordability ?" "Yes" "No")))
	
; Do you also need affordability? Yes
(defrule affordability-yes-moddability
    ?od <- (odpowiedz "Do you also need affordability ?" "Yes")
    ?pid <- (pytanie "Do you also need affordability ?" "Yes" "No")
    =>
    (retract ?pid)
    (assert (pytanie "DIY kit or assembled machine?" "Kit" "Assembled")))
	
; DIY kit or assembled machine? Kit
(defrule diy-assembled-kit
    ?od <- (odpowiedz "DIY kit or assembled machine?" "Kit")
    ?pid <- (pytanie "DIY kit or assembled machine?" "Kit" "Assembled")
    =>
    (retract ?pid)
    (assert (pytanie "Would you rather have more build volume or faster printing speeds?" "Speed" "Build volume")))

; Would you rather have more build volume or faster printing speeds? Speed
(defrule build-volume-or-speeds-speed-moddability
    ?od <- (odpowiedz "Would you rather have more build volume or faster printing speeds?" "Speed")
    ?pid <- (pytanie "Would you rather have more build volume or faster printing speeds?" "Speed" "Build volume")
    =>
    (retract ?pid)
    (assert (wynik "Vellman K8200")))

; Would you rather have more build volume or faster printing speeds? Build volume
(defrule build-volume-or-speeds-build-volume-moddability
    ?od <- (odpowiedz "Would you rather have more build volume or faster printing speeds?" "Build volume")
    ?pid <- (pytanie "Would you rather have more build volume or faster printing speeds?" "Speed" "Build volume")
    =>
    (retract ?pid)
    (assert (pytanie "Would you rather have better company support or better community support?" "Community" "Company")))

; Would you rather have better company support or better community support? Community
(defrule support-community-moddability
    ?od <- (odpowiedz "Would you rather have better company support or better community support?" "Community")
    ?pid <- (pytanie "Would you rather have better company support or better community support?" "Community" "Company")
    =>
    (retract ?pid)
    (assert (wynik "Rigdibot Regular")))

; Would you rather have better company support or better community support? Company
(defrule support-company-moddability
    ?od <- (odpowiedz "Would you rather have better company support or better community support?" "Community")
    ?pid <- (pytanie "Would you rather have better company support or better community support?" "Community" "Company")
    =>
    (retract ?pid)
    (assert (wynik "Rigdibot Advanced")))
	
; Would you rather have better company support or better community support? Company
(defrule support-company-moddability
    ?od <- (odpowiedz "Would you rather have better company support or better community support?" "Company")
    ?pid <- (pytanie "Would you rather have better company support or better community support?" "Community" "Company")
    =>
    (retract ?pid)
    (assert (wynik "Printbot Metal Plus")))
