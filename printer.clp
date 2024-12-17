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
    (assert (pytanie "A little bit more build volume or a LOT more build volume?" "A little more" "A lot more")))
	

; A little bit more build volume or a LOT more build volume? A little more
(defrule volume-a-little-moddability
    ?od <- (odpowiedz "A little bit more build volume or a LOT more build volume?" "A little more")
    ?pid <- (pytanie "A little bit more build volume or a LOT more build volume?" "A little more" "A lot more")
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
    ?od <- (odpowiedz "Would you rather have better company support or better community support?" "Company")
    ?pid <- (pytanie "Would you rather have better company support or better community support?" "Community" "Company")
    =>
    (retract ?pid)
    (assert (wynik "Printbot Metal Plus")))

; DIY kit or assembled machine? Assembled
(defrule diy-assembled-assembled
    ?od <- (odpowiedz "DIY kit or assembled machine?" "Assembled")
    ?pid <- (pytanie "DIY kit or assembled machine?" "Kit" "Assembled")
    =>
    (retract ?pid)
    (assert (wynik "Robo3d")))
	
; Do you also need affordability? No
(defrule affordability-no-moddability
    ?od <- (odpowiedz "Do you also need affordability ?" "No")
    ?pid <- (pytanie "Do you also need affordability ?" "Yes" "No")
    =>
    (retract ?pid)
    (assert (pytanie "DIY kit or assembled machine?" "Kit " "Assembled ")))
	
; DIY kit or assembled machine? Assembled
(defrule diy-assembled-no-assembled
    ?od <- (odpowiedz "DIY kit or assembled machine?" "Assembled ")
    ?pid <- (pytanie "DIY kit or assembled machine?" "Kit " "Assembled ")
    =>
    (retract ?pid)
    (assert (wynik "Luizbot TAZ 4")))

; DIY kit or assembled machine? Kit
(defrule diy-assembled-no-kit
    ?od <- (odpowiedz "DIY kit or assembled machine?" "Kit ")
    ?pid <- (pytanie "DIY kit or assembled machine?" "Kit " "Assembled ")
    =>
    (retract ?pid)
    (assert (wynik "Luizbot KITTAZ")))
	
;;;;;;; branch 3
	
; Ease of Use
(defrule ease-of-use
    ?od <- (odpowiedz "The thing I want most is...?" "Ease of Use")
    ?pid <- (pytanie "The thing I want most is...?" "Ultra High Print Quality" "Moddability" "Ease of Use" "Big Build Volume" "Portability")
    =>
    (retract ?pid)
    (assert (pytanie "Do you also need affordability?" "Yes " "No ")))
	
; Do you also need affordability? Yes
(defrule affordability-yes-ease
    ?od <- (odpowiedz "Do you also need affordability?" "Yes ")
    ?pid <- (pytanie "Do you also need affordability?" "Yes " "No ")
    =>
    (retract ?pid)
    (assert (pytanie "Would you rather have more ease of use or more build volume?" "Ease of use" "Build volume")))
	
; Would you rather have more ease of use or more build volume? Ease of use
(defrule ease-over-build
    ?od <- (odpowiedz "Would you rather have more ease of use or more build volume?" "Ease of use")
    ?pid <- (pytanie "Would you rather have more ease of use or more build volume?" "Ease of use" "Build volume")
    =>
    (retract ?pid)
    (assert (wynik "Dremel IdeaBuilder")))

; Would you rather have more ease of use or more build volume? Build volume
(defrule build-over-ease
    ?od <- (odpowiedz "Would you rather have more ease of use or more build volume?" "Build volume")
    ?pid <- (pytanie "Would you rather have more ease of use or more build volume?" "Ease of use" "Build volume")
    =>
    (retract ?pid)
    (assert (pytanie "Do you want an open source printer?" "Yes" "No/I don't care")))

; Do you want an open source printer? Yes
(defrule open-source-yes
    ?od <- (odpowiedz "Do you want an open source printer?" "Yes")
    ?pid <- (pytanie "Do you want an open source printer?" "Yes" "No/I don't care")
    =>
    (retract ?pid)
    (assert (pytanie "Do you need dual extruder? " "Yes" "No")))

; Do you need dual extruder? Yes
(defrule dual-extruder-yes-ease
    ?od <- (odpowiedz "Do you need dual extruder? " "Yes")
    ?pid <- (pytanie "Do you need dual extruder? " "Yes" "No")
    =>
    (retract ?pid)
    (assert (pytanie "Do you need a big build volume?" "Yes" "No")))
	
; "Do you need a big build volume? Yes
(defrule big-build-yes-ease
    ?od <- (odpowiedz "Do you need a big build volume?" "Yes")
    ?pid <- (pytanie "Do you need a big build volume?" "Yes" "No")
    =>
    (retract ?pid)
    (assert (wynik "Solidooole Workbench")))
	
; "Do you need a big build volume? No
(defrule big-build-no-ease
    ?od <- (odpowiedz "Do you need a big build volume?" "No")
    ?pid <- (pytanie "Do you need a big build volume?" "Yes" "No")
    =>
    (retract ?pid)
    (assert (wynik "Solidooole Workbench Apprentice")))
	
; Do you need dual extruder? No
(defrule dual-extruder-no-ease
    ?od <- (odpowiedz "Do you need dual extruder? " "No")
    ?pid <- (pytanie "Do you need dual extruder? " "Yes" "No")
    =>
    (retract ?pid)
    (assert (wynik "Solidooole 4")))
		
; Do you want an open source printer? No/I don't care
(defrule open-source-no
    ?od <- (odpowiedz "Do you want an open source printer?" "No/I don't care")
    ?pid <- (pytanie "Do you want an open source printer?" "Yes" "No/I don't care")
    =>
    (retract ?pid)
    (assert (pytanie "Do you need dual extruder? " "Yes " "No ")))
	
; Do you need dual extruder? No
(defrule dual-extruder-no-ease-2
    ?od <- (odpowiedz "Do you need dual extruder? " "No ")
    ?pid <- (pytanie "Do you need dual extruder? " "Yes " "No ")
    =>
    (retract ?pid)
    (assert (pytanie "How does a build in 3d scanner sound?" "Cool!" "Eh.")))
	
; How does a build in 3d scanner sound? Cool
(defrule 3d-scanner-cool-ease
    ?od <- (odpowiedz "How does a build in 3d scanner sound?" "Cool!")
    ?pid <- (pytanie "How does a build in 3d scanner sound?" "Cool!" "Eh.")
    =>
    (retract ?pid)
    (assert (wynik "XYZ Printing DaVinci 1.0 AiO")))
	
; How does a build in 3d scanner sound? Eh
(defrule 3d-scanner-eh-ease
    ?od <- (odpowiedz "How does a build in 3d scanner sound?" "Eh.")
    ?pid <- (pytanie "How does a build in 3d scanner sound?" "Cool!" "Eh.")
    =>
    (retract ?pid)
    (assert (wynik "XYZ Printing DaVinci 1.0")))	

; Do you need dual extruder? Yes
(defrule dual-extruder-yes-ease-2
    ?od <- (odpowiedz "Do you need dual extruder? " "Yes ")
    ?pid <- (pytanie "Do you need dual extruder? " "Yes " "No ")
    =>
    (retract ?pid)
    (assert (wynik "XYZ Printing DaVinci 2.0")))	
	
; Do you also need affordability? No
(defrule affordability-no-ease
    ?od <- (odpowiedz "Do you also need affordability?" "No ")
    ?pid <- (pytanie "Do you also need affordability?" "Yes " "No ")
    =>
    (retract ?pid)
    (assert (pytanie "Are you opposed to the idea of having MakerBot?" "Yes" "No")))

; Are you opposed to the idea of having MakerBot? No
(defrule opposed-idead-no-ease
    ?od <- (odpowiedz "Are you opposed to the idea of having MakerBot?" "No")
    ?pid <- (pytanie "Are you opposed to the idea of having MakerBot?" "Yes" "No")
    =>
    (retract ?pid)
    (assert (wynik "MakerBot Replicator 2")))	
	
; Are you opposed to the idea of having MakerBot? YES
(defrule opposed-idead-yes-ease
    ?od <- (odpowiedz "Are you opposed to the idea of having MakerBot?" "Yes")
    ?pid <- (pytanie "Are you opposed to the idea of having MakerBot?" "Yes" "No")
    =>
    (retract ?pid)
    (assert (pytanie "How about MakerBot clone?" "That's fine!" "No way!")))
	
; How about MakerBot clone? That's fine!
(defrule how-about-a-colne-fine-ease
    ?od <- (odpowiedz "How about MakerBot clone?" "That's fine!")
    ?pid <- (pytanie "How about MakerBot clone?" "That's fine!" "No way!")
    =>
    (retract ?pid)
	(assert (wynik "Flashforge Creator")))	
	
; How about MakerBot clone? No way!
(defrule how-about-a-colne-fine-ease
    ?od <- (odpowiedz "How about MakerBot clone?" "No way!")
    ?pid <- (pytanie "How about MakerBot clone?" "That's fine!" "No way!")
    =>
    (retract ?pid)
	(assert (pytanie "Do you need a dual" "That's fine!" "No way!")))	
