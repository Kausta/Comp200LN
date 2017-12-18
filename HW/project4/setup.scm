 		   	      
;;------------------------------------------------------------
;; Utils to connect places by way of exits
 		   	      
(define (can-go-both-ways from direction reverse-direction to)
  (create-exit from direction to)
  (create-exit to reverse-direction from))
 		   	      
;;------------------------------------------------------------
;; Create our world... 		   	      
 		   	      
(define (create-world) 		   	      
  ; Create some places 		   	      
  (let ((eng-building (create-place 'eng-building))
	(sci-building (create-place 'sci-building))
	(sos-building (create-place 'sos-building))
	(cas-building (create-place 'cas-building))
	(great-court (create-place 'great-court))
	(graduation-stage (create-place 'graduation-stage))
	(adm-building (create-place 'adm-building))
	(student-center (create-place 'student-center))
	(library (create-place 'library))
	(gym (create-place 'gym))
	(dorms (create-place 'dorms))
	(cici-bufe (create-place 'cici-bufe))
	(suzy-cafe (create-place 'suzy-cafe))
	(bookstore (create-place 'bookstore))
	(computer-club (create-place 'computer-club))
	(divan (create-place 'divan))
	(migros (create-place 'migros))
	(soccer-field (create-place 'soccer-field))
	(amphitheater (create-place 'amphitheater))
	(registrar-office (create-place 'registrar-office))
	(bursar-office (create-place 'bursar-office))
	(parking-lot (create-place 'parking-lot))
	(eng-z21 (create-place 'eng-z21))
	(eng-b30 (create-place 'eng-b30))
	(eng-auditorium (create-place 'eng-auditorium))
	(deans-office (create-place 'deans-office)))
 		   	      
    ; Connect up places 		   	      
    (can-go-both-ways eng-building 'north 'south soccer-field)
    (can-go-both-ways eng-building 'west 'east parking-lot)
    (can-go-both-ways eng-building 'in 'out eng-z21)
    (can-go-both-ways eng-z21 'south 'north eng-auditorium)
    (can-go-both-ways eng-z21 'down 'up eng-b30)
    (can-go-both-ways eng-z21 'up 'down deans-office)
    (can-go-both-ways eng-building 'south 'north sci-building)
    (can-go-both-ways sci-building 'south 'north sos-building)
    (can-go-both-ways sos-building 'south 'north cas-building)
    (can-go-both-ways sos-building 'east 'west amphitheater)
    (can-go-both-ways cas-building 'south 'north great-court)
    (can-go-both-ways great-court 'south 'north adm-building)
    (can-go-both-ways great-court 'west 'east library)
    (can-go-both-ways great-court 'east 'west student-center)
    (can-go-both-ways great-court 'up 'down graduation-stage)
    (can-go-both-ways library 'west 'east gym)
    (can-go-both-ways adm-building 'south 'north dorms)
    (can-go-both-ways adm-building 'in 'out registrar-office)
    (can-go-both-ways registrar-office 'west 'east bursar-office)
    (can-go-both-ways student-center 'in 'out suzy-cafe)
    (can-go-both-ways suzy-cafe 'east 'west bookstore)
    (can-go-both-ways suzy-cafe 'down 'up cici-bufe)
    (can-go-both-ways cici-bufe 'west 'east computer-club)
    (can-go-both-ways cici-bufe 'north 'south migros)
    (can-go-both-ways cici-bufe 'down 'up divan)
 		   	      
    ; Create some things 		   	      
    (create-thing 'white-board eng-b30)
    (create-thing 'fancy-cars parking-lot)
    (create-thing 'flag-pole great-court)
    (create-mobile-thing 'tons-of-code dorms)
    (create-mobile-thing 'lecture-notes eng-b30)
    (create-mobile-thing 'problem-set eng-z21)
    (create-mobile-thing 'final-exam eng-auditorium)
    (create-mobile-thing 'sicp bookstore)
    (create-mobile-thing 'engineering-book library)
    (create-mobile-thing 'diploma registrar-office)
    (create-mobile-thing 'football soccer-field)
    (create-mobile-thing 'basketball gym)
    (create-mobile-thing 'scheme-manual computer-club)
    (create-mobile-thing 'transcript deans-office)
    (create-mobile-thing 'milk migros)
    (create-mobile-thing 'kofte cici-bufe)
    (create-mobile-thing 'coke suzy-cafe)
    (create-mobile-thing 'profiterol divan)
    (create-mobile-thing 'umbrella amphitheater)
 		   	      
    (list eng-building sci-building sos-building cas-building
	  great-court graduation-stage adm-building student-center
	  library gym dorms cici-bufe suzy-cafe bookstore
	  computer-club divan migros soccer-field amphitheater
	  registrar-office bursar-office parking-lot eng-z21 eng-b30
	  eng-auditorium deans-office)
    )) 		   	      
 		   	      
(define (populate-weapons rooms)
  (create-weapon 'chair-of-the-faculty (pick-random rooms) 5)
  (create-weapon 'student-riot (pick-random rooms) 4)
  (create-weapon 'sicp-book (pick-random rooms) 2)
  (create-weapon 'inflatable-lambda (pick-random rooms) 3)
  (create-weapon 'comp200-midterm (pick-random rooms) 3)
  (create-weapon 'stick-of-chalk (pick-random rooms) 1)
  ; my weapons
  (create-weapon 'plain-old-spoon (pick-random rooms) 1)
  (create-weapon 'excalibur (pick-random rooms) 10)
  (create-weapon 'broken-pistol (pick-random rooms) 2)
  'populated-weapons) 		   	      
 		   	      
(define (populate-players rooms)
  (create-autonomous-player 'ben-bitdiddle (pick-random rooms)
			    2 2)
  (create-autonomous-player 'alyssa-p-hacker (pick-random rooms)
			    2 2)
  ; Changed prof-yuret to a violent player, so that he can attack the students
  (create-violent-player 'prof-yuret (pick-random rooms)
			    1 2 4)
  (create-autonomous-player 'comp200-student (pick-random rooms)
			    2 1)
  (create-autonomous-player 'lambda-man (pick-random rooms)
			    3 3)
 (create-troll 'suzy (car (myfilter (lambda (x) (eq? (ask x 'name) 'suzy-cafe))
				      rooms))
		3 1) 		   	      
  (create-troll 'cici (car (myfilter (lambda (x) (eq? (ask x 'name) 'cici-bufe))
				      rooms))
		3 1)
  ; Added violent players
  (define akame (create-violent-player 'akame (pick-random rooms) 4 4 2)) ; Akame is fast and attacks very frequently, to test
  ; Give Akame her blade, and make her start with it, so testing is easier
  ; try to make akame take it silently
  (define murasame (create-weapon 'murasame (ask akame 'LOCATION) 5))
  ; This is add-thing because we want to make it silent (and (ask screen 'DEITY-MODE #f) doesn't work here), and also
  ; we know that she doesn't have, it is in the same room, it is mobile, etc... (but mainly bec of above)
  (ask akame 'ADD-THING murasame)

  ; Magicians
  (define raistlin (create-autonomous-magician 'raistlin (pick-random rooms) 2 100 10))
  (define lighting-skill (make-skill 'lighting 50 (lambda (user target) (ask target 'SUFFER 10))))
  (ask raistlin 'learn-skill lighting-skill)
  
  (define duygu (create-autonomous-magician 'duygu (pick-random rooms) 3 40 20))
  (define eat-person-skill (make-skill 'eat-person 20 (lambda (user target) (ask user 'SUFFER 1) (ask target 'SUFFER 2))))
  (ask duygu 'learn-skill eat-person-skill)
  (define useless-skill (make-skill 'useless 5 (lambda (user target)
                                                 (ask user 'SAY (list "I am useless."))
                                                 (ask target 'SAY (list "Yes, you are")))))
  (ask duygu 'learn-skill useless-skill)
  
  
  'populated-players) 		   	      
 		   	      
(define (populate-bombs rooms) 		   	      
  (create-bomb 'C4 (pick-random rooms) 2)
  (create-bomb 'STEAKY (pick-random rooms) 5)
  (create-bomb 'ALIVE-BOMB (pick-random rooms) 10)
  (create-bomb 'HOME-MADE (pick-random rooms) 4)
  (create-bomb 'HAND-BOMB (pick-random rooms) 7)
  (create-bomb-with-timer 'tBomb1 (pick-random rooms) 10)
  (create-bomb-with-timer 'tBomb2 (pick-random rooms) 5)
  (create-bomb-with-timer 'tBomb3 (pick-random rooms) 7)
  (create-bomb-with-timer 'tBomb4 (pick-random rooms) 100)
  (create-bomb-with-timer 'tBomb5 (pick-random rooms) 8)
  (create-bomb-with-timer 'tBomb6 (pick-random rooms) 20)
  'populated-bombs) 		   	      
 		   	      
(define heaven 'will-be-set-by-setup)
(define me 'will-be-set-by-setup)
(define all-rooms 'will-be-set-by-setup)
(define death-exit 'will-be-set-by-setup)
 		   	      
(define (setup name) 		   	      
  (ask clock 'RESET) 		   	      
  (ask clock 'ADD-CALLBACK 		   	      
       (make-clock-callback 'tick-printer clock 'PRINT-TICK))
  (let ((rooms (create-world)))
    ; UNCOMMENT AFTER YOU CREATE CODE FOR WEAPONS
    (populate-weapons rooms) 		   	      
    (populate-players rooms)
    (populate-bombs rooms)
 		   	      
    ;; The initial point of no return
    (set! heaven (create-place 'heaven))
    (set! me (create-magician-avatar name (pick-random rooms) 50 10))
    (ask screen 'SET-ME me) 		   	      
    (set! all-rooms rooms) 		   	      
    (set! death-exit (make-exit nil 'heaven heaven))
    'ready)) 		   	      
 		   	      
;; Some useful example expressions...
 		   	      
;(setup 'ben-bitdiddle) 		   	      
 ;(run-clock 5) 		   	      
 		   	      
;(ask screen 'DEITY-MODE #f) 		   	      
 ;(ask me 'look-around) 		   	      
 ;(ask me 'go 'up) 		   	      
 ;(ask me 'go 'north) 		   	      
 ;(ask me 'take (thing-named 'problem-set))
 		   	      
