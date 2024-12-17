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
	
; A little bit more build volume or a LOT more build volume? A lot more
(defrule volume-a-lot-moddability
    ?od <- (odpowiedz "A little bit more build volume or a LOT more build volume?" "A lot more")
    ?pid <- (pytanie "A little bit more build volume or a LOT more build volume?" "A little more" "A lot more")
    =>
    (retract ?pid)
    (assert (wynik "Rigdibot Big")))
	
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
(defrule how-about-a-clone-no-ease
    ?od <- (odpowiedz "How about MakerBot clone?" "No way!")
    ?pid <- (pytanie "How about MakerBot clone?" "That's fine!" "No way!")
    =>
    (retract ?pid)
	(assert (pytanie "Do you need a dual extruder?     " "Yes     " "No     ")))	
	
; Do you need a dual extruder? Yes
(defrule yo-need-dual-ext-yes-ease
    ?od <- (odpowiedz "Do you need a dual extruder?     " "Yes     ")
    ?pid <- (pytanie "Do you need a dual extruder?     " "Yes     " "No     ")
    =>
    (retract ?pid)
	(assert (pytanie "How does a triple extruder sound?" "Cool!" "Eh.")))	
	
; How does a triple extruder sound?" "Cool!
(defrule triple-ext-cool-ease
    ?od <- (odpowiedz "How does a triple extruder sound?" "Cool!")
    ?pid <- (pytanie "How does a triple extruder sound?" "Cool!" "Eh.")
    =>
    (retract ?pid)
	(assert (wynik "3D Systems CubePro Trio")))	
	
; How does a triple extruder sound?" Eh.!
(defrule triple-ext-no-ease
    ?od <- (odpowiedz "How does a triple extruder sound?" "Eh.")
    ?pid <- (pytanie "How does a triple extruder sound?" "Cool!" "Eh.")
    =>
    (retract ?pid)
	(assert (pytanie "So then just a dual extruder. Do you need a big build volume?" "Yes" "No")))	
	
; "So then just a dual extruder. Do you need a big build volume?" "Yes
(defrule just-dual-big-volume-yes-ease
    ?od <- (odpowiedz "So then just a dual extruder. Do you need a big build volume?" "Yes")
    ?pid <- (pytanie "So then just a dual extruder. Do you need a big build volume?" "Yes" "No")
    =>
    (retract ?pid)
	(assert (wynik "Leapfrog Creator XL")))	
	
; "So then just a dual extruder. Do you need a big build volume?" "No
(defrule just-dual-big-volume-no-ease
    ?od <- (odpowiedz "So then just a dual extruder. Do you need a big build volume?" "No")
    ?pid <- (pytanie "So then just a dual extruder. Do you need a big build volume?" "Yes" "No")
    =>
    (retract ?pid)
	(assert (wynik "Leapfrog Creator HS")))	
		
; Do you need a dual extruder? No
(defrule yo-need-dual-ext-no-ease
    ?od <- (odpowiedz "Do you need a dual extruder?     " "No     ")
    ?pid <- (pytanie "Do you need a dual extruder?     " "Yes     " "No     ")
    =>
    (retract ?pid)
	(assert (pytanie "Make your pick. These three have diffrent build volumes and are priced respectivly." "SeeMeCNC Orion Delta" "Airwolf HDX" "Leapfrog Creatr")))	
	
; za dlugie 
(defrule pick-one-three-one-ease
    ?od <- (odpowiedz "Make your pick. These three have diffrent build volumes and are priced respectivly." "SeeMeCNC Orion Delta")
    ?pid <- (pytanie "Make your pick. These three have diffrent build volumes and are priced respectivly." "SeeMeCNC Orion Delta" "Airwolf HDX" "Leapfrog Creatr")
    =>
    (retract ?pid)
	(assert (wynik "SeeMeCNC Orion Delta")))	
	
; za dlugie 
(defrule pick-one-three-two-ease
    ?od <- (odpowiedz "Make your pick. These three have diffrent build volumes and are priced respectivly." "Airwolf HDX")
    ?pid <- (pytanie "Make your pick. These three have diffrent build volumes and are priced respectivly." "SeeMeCNC Orion Delta" "Airwolf HDX" "Leapfrog Creatr")
    =>
    (retract ?pid)
	(assert (wynik "Airwolf HDX")))		
	
; za dlugie 
(defrule pick-one-three-three-ease
    ?od <- (odpowiedz "Make your pick. These three have diffrent build volumes and are priced respectivly." "Leapfrog Creatr")
    ?pid <- (pytanie "Make your pick. These three have diffrent build volumes and are priced respectivly." "SeeMeCNC Orion Delta" "Airwolf HDX" "Leapfrog Creatr")
    =>
    (retract ?pid)
	(assert (wynik "Leapfrog Creatr")))		
		
;;;;;;; branch 4
	
; Big Build Volume
(defrule big-build-volume
    ?od <- (odpowiedz "The thing I want most is...?" "Big Build Volume")
    ?pid <- (pytanie "The thing I want most is...?" "Ultra High Print Quality" "Moddability" "Ease of Use" "Big Build Volume" "Portability")
    =>
    (retract ?pid)
    (assert (pytanie "Do you also need affordability?" "Yes  " "No ")))	
	
; Do you also need affordability
(defrule affordability-yes-big
    ?od <- (odpowiedz "Do you also need affordability?" "Yes  ")
    ?pid <- (pytanie "Do you also need affordability?" "Yes  " "No ")
    =>
    (retract ?pid)
	(assert (pytanie "Do you want big build volume or REALLY BIG build volume?" "REALLY Big" "Big")))		
	
; Do you want big build volume or REALLY BIG build volume?" "REALLY Big
(defrule areally-big-big-build
    ?od <- (odpowiedz "Do you want big build volume or REALLY BIG build volume?" "REALLY Big")
    ?pid <- (pytanie "Do you want big build volume or REALLY BIG build volume?" "REALLY Big" "Big")
    =>
    (retract ?pid)
	(assert (pytanie "DIY kit or assembled machine?" "DIY kit" "Assembled")))		
	
; DIY kit or assembled machine?" "DIY kit
(defrule diy-assembled-kit-big
    ?od <- (odpowiedz "DIY kit or assembled machine?" "DIY kit")
    ?pid <- (pytanie "DIY kit or assembled machine?" "DIY kit" "Assembled")
    =>
    (retract ?pid)
	(assert (wynik "SeeMeCNC Rostock MAX v2")))		

; DIY kit or assembled machine?" "DIY kit
(defrule diy-assembled-assembled-big
    ?od <- (odpowiedz "DIY kit or assembled machine?" "Assembled")
    ?pid <- (pytanie "DIY kit or assembled machine?" "DIY kit" "Assembled")
    =>
    (retract ?pid)
	(assert (wynik "Wanhao Duplicator 5	")))	

; Do you want big build volume or REALLY BIG build volume? Big
(defrule affordability-yes-really-big
    ?od <- (odpowiedz "Do you want big build volume or REALLY BIG build volume?" "Big")
    ?pid <- (pytanie "Do you want big build volume or REALLY BIG build volume?" "REALLY Big" "Big")
    =>
    (retract ?pid)
	(assert (wynik "Rigdibot Big")))	

; Do you also need affordability No
(defrule affordability-no-big
    ?od <- (odpowiedz "Do you also need affordability?" "No ")
    ?pid <- (pytanie "Do you also need affordability?" "Yes  " "No ")
    =>
    (retract ?pid)
	(assert (pytanie "Are you opposed to the idea of having MakerBot" "Yes" "No")))		

; Are you opposed to the idea of having MakerBot" "Yes
(defrule makerbot-yes-big
    ?od <- (odpowiedz "Are you opposed to the idea of having MakerBot" "Yes")
    ?pid <- (pytanie "Are you opposed to the idea of having MakerBot" "Yes" "No")
    =>
    (retract ?pid)
	(assert (wynik "Leapfrog Creator XL")))

; Are you opposed to the idea of having MakerBot" "No
(defrule makerbot-no-big
    ?od <- (odpowiedz "Are you opposed to the idea of having MakerBot" "No")
    ?pid <- (pytanie "Are you opposed to the idea of having MakerBot" "Yes" "No")
    =>
    (retract ?pid)
	(assert (wynik "MakerBot Replicator Z18")))

;;;;;;; branch 5
	
; Portability
(defrule portability-start
    ?od <- (odpowiedz "The thing I want most is...?" "Portability")
    ?pid <- (pytanie "The thing I want most is...?" "Ultra High Print Quality" "Moddability" "Ease of Use" "Big Build Volume" "Portability")
    =>
    (retract ?pid)
    (assert (pytanie "Are you opposed to the idea of having MakerBot? " "Yes" "No")))	

;  Are you opposed to the idea of having MakerBot No
(defrule maker-bot-no-portability
    ?od <- (odpowiedz "Are you opposed to the idea of having MakerBot? " "No")
    ?pid <- (pytanie "Are you opposed to the idea of having MakerBot? " "Yes" "No")
    =>
    (retract ?pid)
    (assert (wynik "MakerBot Replicator Mini")))	

; Are you opposed to the idea of having MakerBot Yes
(defrule maker-bot-yes-portability
    ?od <- (odpowiedz "Are you opposed to the idea of having MakerBot? " "Yes")
    ?pid <- (pytanie "Are you opposed to the idea of having MakerBot? " "Yes" "No")
    =>
    (retract ?pid)
    (assert (pytanie "What level of portability are we talking about..." "Foldable and battery operatable" "Lightweight and small")))

; What level of portability are we talking about..." "Foldable and battery operatable
(defrule portability-foldable-portability
    ?od <- (odpowiedz "What level of portability are we talking about..." "Foldable and battery operatable")
    ?pid <- (pytanie "What level of portability are we talking about..." "Foldable and battery operatable" "Lightweight and small")
    =>
    (retract ?pid)
    (assert (wynik "Portablee GO")))	

; What level of portability are we talking about... Lightweight and small
(defrule portability-lightweight-portability
    ?od <- (odpowiedz "What level of portability are we talking about..." "Lightweight and small")
    ?pid <- (pytanie "What level of portability are we talking about..." "Foldable and battery operatable" "Lightweight and small")
    =>
    (retract ?pid)
    (assert (pytanie "Would you rather have the ability to print more materials or have a more portable printer?" "More materials" "Portability")))	

; "Would you rather have the ability to print more materials or have a more portable printer?" "More materials"
(defrule more-materials-portability
    ?od <- (odpowiedz "Would you rather have the ability to print more materials or have a more portable printer?" "More materials")
    ?pid <- (pytanie "Would you rather have the ability to print more materials or have a more portable printer?" "More materials" "Portability")
    =>
    (retract ?pid)
    (assert (wynik "Deezmaker Bukito")))	

; "Would you rather have the ability to print more materials or have a more portable printer? Portability"
(defrule portability-portability
    ?od <- (odpowiedz "Would you rather have the ability to print more materials or have a more portable printer?" "Portability")
    ?pid <- (pytanie "Would you rather have the ability to print more materials or have a more portable printer?" "More materials" "Portability")
    =>
    (retract ?pid)
    (assert (wynik "Printbot Simple Metal")))