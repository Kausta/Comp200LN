;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;;::;::;:::
;;;   The Object-Oriented Adventure Game
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;;::;:::;;;
;;; 		   	      
;;; ckorkmaz16@ku.edu.tr     Mon Nov 20 18:12:04 2017
;;; 		   	      
;;; Before you start: 		   	      
;;; * Please read the project handout available on the course
;;;   web site first to get a basic idea about the project and the
;;;   logic behind it, then to find out the details about what
;;;   your tasks are for the rest of the project.
;;; 		   	      
;;; * The following code should be studied and loaded for this
;;;   project.  Please do not modify these files, put all your work in
;;;   this file. 		   	      
;;; 		   	      
;;; - objsys.scm: support for an elementary object system
;;; - objtypes.scm: a few nice object classes
;;; - setup.scm: a bizarre world constructed using these classes
;;; 		   	      
;;; * Plan your work with pencil and paper before starting to code.
;;; 		   	      
;;; While you are working: 		   	      
;;; * Type all your work and notes in the appropriate sections of this file.
;;; * Please do not delete any of the existing lines.
;;; * Use the procedure names given in the instructions.
;;; * Remember to frequently save your file.
;;; * Use semicolon (;) to comment out text, tests and unused code.
;;; * Remember to document your code (in this file)
;;; * Remember our collaboration policy: you can discuss with your friends but:
;;; 		   	      
;;;   *** NOTHING WRITTEN GETS EXCHANGED ***
;;; 		   	      
;;; 		   	      
;;; When you are done: 		   	      
;;; * Perform a final save and submit your work following the instructions.
;;; * Please do not make any modifications after midnight on the due date.
;;; * Please send an email comp200-common@ku.edu.tr if you have any questions.
;;; * Make sure your file loads without errors:
;;; ****************************************************************************
;;; ***  Your code should run without any syntactic errors. Projects  causing error will NOT be graded. ***
;;; ****************************************************************************
;;; 		   	      
;; Do NOT modify or delete the lines below.
(#%require (only racket/base random))
(load "objsys.scm") 		   	      
(load "objtypes.scm") 		   	      
(load "setup.scm") 		   	      
(define nil '()) 		   	      
(define your-answer-here #f) 		   	      
;;;;;;;;; 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;;::;:::;;:
;;; PART II. Programming Assignment
;;; 		   	      
;;; The answers to the computer exercises in Section 5 go in the
;;; appropriate sections below.
;;; 		   	      
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:;;;::;;;;
;;;;;;;;;;;;; Computer Exercise 0: Setting up ;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 		   	      
;;;;;;;;;;;;; CODES: ;;;;;;;;;;;;;
;;
;(setup 'caner)
;(ask screen 'deity-mode #f)
;(ask (ask me 'location) 'name)
;(ask me 'say '(Hello World))
;(ask me 'look-around)
;(ask me 'go 'east)
;(ask me 'take (thing-named 'umbrella))
;(ask me 'toss 'umbrella)
;(ask me 'die)
	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:;;;::;;;:
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;; 		   	      
 		   	      
; ready
; sos-building
; 
; At sos-building caner says -- hello world
;
; You are in sos-building 
; You are not holding anything. 
; There is no stuff in the room. 
; There are no other people around you. 
; The exits are in directions: east south north ok		   	      
;
; caner moves from sos-building to amphitheater 
; --- the-clock Tick 0 --- 
; You are in amphitheater 
; You are not holding anything. 
; You see stuff in the room: umbrella 
; There are no other people around you. 
; The exits are in directions: west #t
;
; At amphitheater caner says -- I take umbrella from amphitheater
;
; At amphitheater caner says -- I drop umbrella at amphitheater
;
; At amphitheater caner says -- SHREEEEK!  I, uh, suddenly feel very faint... 
; An earth-shattering, soul-piercing scream is heard... 
; caner moves from amphitheater to heaven game-over-for-you-dude
;; 		   	      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:;;;::;;:;
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:;;;::;;::
;;;;;; Computer Exercise 1: Understanding installation;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:;;;::;:;;
;; 		   	      
;;;;;;;;;;;;; ANSWER: ;;;;;;;;;;;;;
;; 		   	      
 		   	      
; If we do (ask person-part 'INSTALL) instead of (delegate person-part self ’INSTALL))
;  it installs its own self (person-part) to the location (since ask will give the self as person-part to person,
;  which will return the install method from thing-part of mobile-thing-part, and that will install
;  the person-part to the location, not the autonomous person)
;  however the self of autonomous part also thinks it is in that location
;  This doesn't become a problem until it moves. When it moves,
;  it will ask its mobile-thing part to change location, which will try to delete the self (where self = autonomous person)
;  from the location, however there is no such thing (since only the player-thing part is in the location which != auto. person)
;  and will add the autonomous person to new location. Thus, the person is still in the first room since it didn't got deleted,
;  however the autonomous person is also in the second room since it got added to there

 		   	      
;; 		   	      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:;;;::;:;:
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:;;;::;::;
;;;;;;;;;;;; Computer Exercise 2: Who just died? ;;;;;;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:;;;::;:::
;; 		   	      
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;; 		   	      
;; The procedures used to wander until death happens
;(setup 'caner)
;(ask screen 'deity-mode #f)
;(ask me 'look-around)
;(ask me 'go 'down)

;(ask (car (ask heaven 'things)) 'name)
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:;;;:::;;;
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;; 		   	      
 		   	      
; When dead, the victim goes to heaven
;  so the last person arrived heaven must be the victim
;  so the victim is the last added thing to the container of heaven
;  thus it is front of the list of persons in heaven (which is things of heaven)
; Thus we can get the name of last person in heaven as
;  > (ask (car (ask heaven 'things)) 'name)
; We could have taken the (myfilter (lambda (x) (is-a x 'PERSON?)) (ask heaven 'things)), however, since nothing should
;   enter the heaven after our person (and no objects other than people should enter the heaven anyway),
;   we can directly take (ask heaven 'things) as the list of people in heaven
; And since we're adding with (cons new-person ...), the new person is in the front right now
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:;;;:::;;:
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;; 		   	      

;ready
;You are in deans-office 
;You are not holding anything. 
;You see stuff in the room: transcript 
;There are no other people around you. 
;The exits are in directions: down ok

;caner moves from deans-office to eng-z21 
;An earth-shattering, soul-piercing scream is heard... 
;At eng-z21 lambda-man says -- Hi caner 
;lambda-man moves from eng-z21 to eng-auditorium 
;At eng-z21 lambda-man says -- Hi caner 
;--- the-clock Tick 0 --- 
;You are in eng-z21 
;You are not holding anything. 
;You see stuff in the room: problem-set 
;You see other people: lambda-man 
;The exits are in directions: up down south out #t

;alyssa-p-hacker

;; 		   	      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:;:;::;;;;
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:;:;::;;;:
;;;;;;;; Computer exercise 3: Having a quick look ;;;;;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:;:;::;;:;
;; 		   	      
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;; 		   	      
 		   	      
;(setup 'caner) 		   	      
;(ask screen 'deity-mode #f)
;(ask me 'look-around)
;(ask me 'go 'south)
;(ask me 'go 'east)
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:;:;::;;::
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;; 		   	      
 		   	      
; The avatar calls the look around method in its go method if the movement was successful,
;  so we look around immediately after moving to a new room
; It does it after the clock tick of movement, so we see the persons in the room in current tick, not in prev one
; If the movement fails, it doesn't call the look around as expected
; We can also see in the transcript that when we move, the look around is called in new place after the clock tick
;  and if we try to move to a non-existent place, so that the movement fails, then it is not called
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:;:;::;:;;
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;; 		   	      
 		   	      
; ready

; You are in eng-building 
; You are not holding anything. 
; There is no stuff in the room. 
; There are no other people around you. 
; The exits are in directions: south in west north ok

; caner moves from eng-building to sci-building 
; --- the-clock Tick 0 --- 
; You are in sci-building 
; You are not holding anything. 
; There is no stuff in the room. 
; There are no other people around you. 
; The exits are in directions: south north #t

; No exit in east direction #f 

;; 		   	      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:;:;::;:;:
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:;:;::;::;
;;;;;; Computer exercise 4: But I'm too young to die!! ;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:;:;::;:::
;; 		   	      
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;; 		   	      
 		   	      
(define (make-person name birthplace) ; symbol, location -> person
  (let ((mobile-thing-part (make-mobile-thing name birthplace))
	(container-part    (make-container))
	(health            3) 		   	      
	(strength          1) 		   	      
   (lives             3)) 		   	      
    (lambda (message) 		   	      
      (case message 		   	      
	((PERSON?) (lambda (self) #T))
	((STRENGTH) (lambda (self) strength))
	((HEALTH) (lambda (self) health))
        ((SAY) 		   	      
         (lambda (self list-of-stuff)
           (ask screen 'TELL-ROOM (ask self 'location)
                (append (list "At" (ask (ask self 'LOCATION) 'NAME)
                                 (ask self 'NAME) "says --")
                           list-of-stuff))
                  'SAID-AND-HEARD))
	((HAVE-FIT) 		   	      
	 (lambda (self) 		   	      
	   (ask self 'SAY '("Yaaaah! I am upset!"))
	   'I-feel-better-now))
 		   	      
	((PEOPLE-AROUND)	; other people in room...
	 (lambda (self) 		   	      
	   (let* ((in-room (ask (ask self 'LOCATION) 'THINGS))
		  (people (myfilter (lambda (x) (is-a x 'PERSON?)) in-room)))
	     (delq self people))))
 		   	      
	((STUFF-AROUND)		; stuff (non people) in room...
	 (lambda (self) 		   	      
	   (let* ((in-room (ask (ask self 'LOCATION) 'THINGS))
		  (stuff (myfilter (lambda (x) (not (is-a x 'PERSON?))) in-room)))
	     stuff))) 		   	      
 		   	      
	((PEEK-AROUND)		; other people's stuff...
	 (lambda (self) 		   	      
	   (let ((people (ask self 'PEOPLE-AROUND)))
	     (accumulate append '() (map (lambda (p) (ask p 'THINGS)) people)))))
 		   	      
	((TAKE) 		   	      
	 (lambda (self thing) 		   	      
	   (cond ((ask self 'HAVE-THING? thing)  ; already have it
		  (ask self 'SAY (list "I am already carrying"
				       (ask thing 'NAME)))
		  #f) 		   	      
		 ((or (is-a thing 'PERSON?)
		      (not (is-a thing 'MOBILE-THING?)))
		  (ask self 'SAY (list "I try but cannot take"
				       (ask thing 'NAME)))
		  #F) 		   	      
		 (else 		   	      
		  (let ((owner (ask thing 'LOCATION)))
		    (ask self 'SAY (list "I take" (ask thing 'NAME)
					 "from" (ask owner 'NAME)))
		    (if (is-a owner 'PERSON?)
			(ask owner 'LOSE thing self)
			(ask thing 'CHANGE-LOCATION self))
		    thing))))) 		   	      
 		   	      
	((LOSE) 		   	      
	 (lambda (self thing lose-to)
	   (ask self 'SAY (list "I lose" (ask thing 'NAME)))
	   (ask self 'HAVE-FIT)
	   (ask thing 'CHANGE-LOCATION lose-to)))
 		   	      
	((DROP) 		   	      
	 (lambda (self thing) 		   	      
	   (ask self 'SAY (list "I drop" (ask thing 'NAME)
				"at" (ask (ask self 'LOCATION) 'NAME)))
	   (ask thing 'CHANGE-LOCATION (ask self 'LOCATION))))
 		   	      
        ((GO-EXIT) 		   	      
         (lambda (self exit) 		   	      
           (ask exit 'USE self)))
 		   	      
	((GO) 		   	      
	 (lambda (self direction) ; person, symbol -> boolean
	   (let ((exit (ask (ask self 'LOCATION) 'EXIT-TOWARDS direction)))
	     (if (is-a exit 'EXIT?)
                 (ask self 'GO-EXIT exit)
		 (begin (ask screen 'TELL-ROOM (ask self 'LOCATION)
			     (list "No exit in" direction "direction"))
			#F)))))
	((SUFFER) 		   	      
	 (lambda (self hits) 		   	      
	   (ask self 'SAY (list "Ouch!" hits "hits is more than I want!"))
	   (set! health (- health hits))
	   (if (<= health 0) (ask self 'DIE))
	   health)) 		   	      
 		   	      
	((DEATH-SCREAM) 		   	      
	 (lambda (self) 		   	      
	   (ask screen 'TELL-WORLD
		'("An earth-shattering, soul-piercing scream is heard..."))))
 		   	      
	((ENTER-ROOM) 		   	      
	 (lambda (self) 		   	      
	   (let ((others (ask self 'PEOPLE-AROUND)))
	     (if (not (null? others))
		 (ask self 'SAY (cons "Hi" (names-of others)))))
	   (ask (ask self 'location) 'make-noise self)
	   #T)) 		   	      
 		   	      
	;; Here is the original DIE method
   #| 		   	      
	 ((DIE) 		   	      
	  (lambda (self) 		   	      
	    (ask self 'SAY '("SHREEEEK!  I, uh, suddenly feel very faint..."))
	    (for-each (lambda (item) (ask self 'LOSE item (ask self 'LOCATION)))
	 	     (ask self 'THINGS))
	    (ask self 'DEATH-SCREAM)
	    (ask death-exit 'USE self)
	    'GAME-OVER-FOR-YOU-DUDE))
   |# 		   	      
	;; Your version goes here:
 		   	      
          ((DIE)
           (lambda (self)
             (ask self 'SAY '("SHREEEEK!  I, uh, suddenly feel very faint...")) ; We can show the death message even though we will reincarnate
             (for-each (lambda (item) (ask self 'LOSE item (ask self 'LOCATION))) ; We lose the items anyway
                       (ask self 'THINGS))
             (ask self 'DEATH-SCREAM) ; Lets everyone know that we died, even though we may reincarnated
             (set! lives (- lives 1)) 
             (cond ((> lives 0) ; Has more lives, so reincarnate
                    (set! health 3) ; Reset the stats
                    (set! strength 1)
                    (delegate mobile-thing-part self 'change-location birthplace)
                    ; If user (the avatar) had died, then we can inform the user about remaining lives and where he is now
                    (if (is-a self 'AVATAR?)
                        (ask screen 'TELL-WORLD (list "You reincarnated back in" (ask birthplace 'name) "with" lives  "lives remaining")))
                    'REINCARNETED)
                   (else ; No lifes remaining, so we actually die
                    (ask death-exit 'USE self)
                    'GAME-OVER-FOR-YOU-DUDE))
             )) 		   	      
 		   	      
	(else (find-method message mobile-thing-part container-part))))))
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:;:;:::;;;
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;; 		   	      
 		   	      
; When a person diee, he/she says the fainting message, drops the items and says the death scream anyways
; Then, the person loses a live
; If there are still more lives, his health and strength gets resetted, and it gets moved to the birthplace
;  Moreover, if the person dies is an avatar (thus the user), then the user is informed about
;  reincarnation, remaning lifes, and where he/she is now
; If there are no lives remaning, then the person actually dies, and goes to heaven
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:;:;:::;;:
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;; 		   	      
 #|		   	      
> (setup 'caner)
ready
> (ask screen 'deity-mode #f)
> (ask me 'look-around)

You are in deans-office 
You are not holding anything. 
You see stuff in the room: transcript 
There are no other people around you. 
The exits are in directions: down ok
> (ask me 'take (thing-named 'transcript))

At deans-office caner says -- I take transcript from deans-office 
> (ask me 'go 'down)

caner moves from deans-office to eng-z21 
At eng-z21 ben-bitdiddle says -- Hi caner 
ben-bitdiddle moves from eng-z21 to eng-building 
--- the-clock Tick 0 --- 
You are in eng-z21 
You are holding: transcript 
You see stuff in the room: problem-set 
There are no other people around you. 
The exits are in directions: up down south out #t
> (ask me 'die)

At eng-z21 caner says -- SHREEEEK!  I, uh, suddenly feel very faint... 
At eng-z21 caner says -- I lose transcript 
At eng-z21 caner says -- Yaaaah! I am upset! 
An earth-shattering, soul-piercing scream is heard... 
You reincarnated back in deans-office with 2 lives remaining reincarneted
> (ask me 'look-around)

You are in deans-office 
You are not holding anything. 
There is no stuff in the room. 
There are no other people around you. 
The exits are in directions: down ok
> (ask me 'die)

At deans-office caner says -- SHREEEEK!  I, uh, suddenly feel very faint... 
An earth-shattering, soul-piercing scream is heard... 
You reincarnated back in deans-office with 1 lives remaining reincarneted
> (ask me 'die)

At deans-office caner says -- SHREEEEK!  I, uh, suddenly feel very faint... 
An earth-shattering, soul-piercing scream is heard... 
caner moves from deans-office to heaven game-over-for-you-dude

 |#		   	      
;; 		   	      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;::;;::;;;;
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;::;;::;;;:
;;; Computer exercise 5: Perhaps to arm oneself against a sea of .... ;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;::;;::;;:;
;; 		   	      
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;; 		   	      
(define (make-weapon name location max-damage)
  ; symbol, location, damage -> weapon
  (let ((mobile-thing-part (make-mobile-thing name location)))
    (lambda (message) 		   	      
      (case message 		   	      
	((WEAPON?) (lambda (self) #t))
        ((DAMAGE) (lambda (self) max-damage))
        ((HIT)
         (lambda (self person target)
           (if (not (eqv? (ask person 'LOCATION) (ask target 'LOCATION))) (error "Cannot attack a person in another room!")) ; Check whether they are in the same room
           (ask screen 'TELL-ROOM (ask person 'LOCATION) ; Inform them and others in their room about the attack
                (list (ask person 'NAME) "is hitting" (ask target 'NAME) "with" (ask self 'NAME)))
           (let ((damage-hit (random-number (ask self 'DAMAGE)))) ; Calculate the damage hit
             (ask target 'SUFFER damage-hit) ; Do the damage
             (ask screen 'TELL-ROOM (ask person 'LOCATION) ; Inform them and others in their room about the damage done
                   (list (ask person 'NAME) "did" damage-hit "damage to" (ask target 'NAME))))))
	(else (get-method message mobile-thing-part)))))) 
 		   	      
(define (create-weapon name location max-damage)
  (create make-weapon name location max-damage))

;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;::;;::;;::
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;; 		   	      
 		   	      
#|
The arguments, weapon? and damage methods are trivial
In hit, we assume person and target are persons, as if they are not, we will get an error in 'SUFFER (or maybe in 'NAME or 'LOCATION)
We first check whether the person and the target are in the same room, as otherwise, the person cannot attack the target
Then, we say to the room they are in that the person is attacking the target using this weapon
Then we calculate the damage as a random-number, which is between 1 and our max damage, and make the target suffer this much damage
Then we say to the room about the damage done in the attack
|#
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;::;;::;:;;
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;; 		   	      
#|
ready

You are in sos-building 
You are not holding anything. 
You see stuff in the room: plain-old-spoon 
There are no other people around you. 
The exits are in directions: east south north ok

> (ask me 'take (thing-named 'plain-old-spoon))

At sos-building caner says -- I take plain-old-spoon from sos-building 
> (ask me 'go 'east)

caner moves from sos-building to amphitheater 
At amphitheater caner says -- Hi comp200-student 
comp200-student moves from amphitheater to sos-building 
At amphitheater comp200-student says -- Hi caner 
At amphitheater comp200-student says -- I take umbrella from amphitheater 
--- the-clock Tick 0 --- 
You are in amphitheater 
You are holding: plain-old-spoon 
There is no stuff in the room. 
You see other people: comp200-student 
The exits are in directions: west #t
> (ask (thing-named 'plain-old-spoon) 'hit me (thing-named 'comp200-student))

caner is hitting comp200-student with plain-old-spoon 
At amphitheater comp200-student says -- Ouch! 1 hits is more than I want!
caner did 1 damage to comp200-student
 |#		   	      
 		   	      
;; 		   	      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;::;;::;:;:
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;::;;::;::;
;;;;;;;; Computer exercise 6: Good thing I'm armed and dangerous ;;;;;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;::;;::;:::
;; 		   	      
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;; 		   	      
 		   	      
;; violent-player
;;
;; activity determines maximum movement
;; miserly determines chance of picking stuff up
;; violence-frequency determines how frequently the player attacks
 		   	      
(define (make-violent-player name birthplace activity miserly violence-frequency)
  (let ((autonomous-player-part (make-autonomous-player name birthplace activity miserly)))
    (lambda (message) 		   	      
      (case message 		   	      
	((VIOLENT-PLAYER?) (lambda (self) #T))
        ((INSTALL) (lambda (self)
		     (ask clock 'ADD-CALLBACK
			  (make-clock-callback 'decide-attack self
					       'ACT-VIOLENTLY))
		     (delegate autonomous-player-part self 'INSTALL)))
        ((VIOLENCE-FREQUENCY) (lambda (self) violence-frequency))
        ((ATTACK-CHANCE) (lambda (self) (/ 1 (ask self 'VIOLENCE-FREQUENCY))))
	((ACT-VIOLENTLY) 		   	      
	 (lambda (self) 		   	      
           (if (< (random) (ask self 'ATTACK-CHANCE)) ; If it is decided that violent player wants to attack
               (let ((others (ask self 'PEOPLE-AROUND)) ; Get the other people
                     (weapons (myfilter (lambda (x) (is-a x 'WEAPON?)) (ask self 'THINGS)))) ; Get all the objects and then filter the weapons (myfilter from objsys)
                 (if (not (or (null? others) (null? weapons))) ; If there is both a person and weapons (that is, it is not the case that there isn't a person or a weapons)
                     (let ((target (pick-random others))
                           (weapon (pick-random weapons)))
                       (ask self 'ACTUALLY-ATTACK weapon target))
                     )))
	   'done-for-this-tick))
        ((ACTUALLY-ATTACK)
         (lambda (self weapon target)
           (ask weapon 'hit self target)
           'attacked
           ))
	(else (get-method message autonomous-player-part))))))
 		   	      
(define (create-violent-player name birthplace activity miserly violence-frequency)
  (create make-violent-player name birthplace activity miserly violence-frequency))
      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;::;;:::;;;
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;; 		   	      
 		   	      
#|
Since violent player is an autonomous player, we take name, birthplace, activity and miserly as arguments
  and create the autonomous part (that is, inherit from it)
We also take an argument for violence frequency
The methods VIOLENT-PLAYER?, VIOLENCE-FREQUENCY are trivial
ATTACK-CHANCE returns the chance of attack in a tick (which is 1 / violence-frequency)
In INSTALL, like the autonomous player and troll classes, we add a callback to clock ticks, which is DECIDE-ATTACK
In DECIDE-ATTACK, we first get a random real number between 0 and 1 and check whether it is in range 0, ATTACK-CHANCE
  so that our character attacks with chance of ATTACK-CHANCE, thus have attack frequency of VIOLENCE-FREQUENCY/
  If we're attacking, we get the other people and weapons in the room, and if there is both another person
  and a weapon, we attack
In ATTACK, we attack the target using the weapon give
|#
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;::;;:::;;:
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;
#|
> (setup 'caner)
> (ask screen 'deity-mode #t)
> (run-clock 10)
...  ;;; (clock output hidden to not put too much output, akame below is a violent person)
--- the-clock Tick 3 ---
akame moves from great-court to library 
At library akame says -- Hi lambda-man 
akame is hitting lambda-man with murasame 
At library lambda-man says -- Ouch! 2 hits is more than I want! 
akame did 2 damage to lambda-man 
...
--- the-clock Tick 5 ---
...
akame moves from cas-building to great-court 
akame moves from great-court to library 
At library akame says -- Hi lambda-man 
akame is hitting lambda-man with murasame 
At library lambda-man says -- Ouch! 4 hits is more than I want! 
At library lambda-man says -- SHREEEEK!  I, uh, suddenly feel very faint... 
An earth-shattering, soul-piercing scream is heard... 
akame did 4 damage to lambda-man
...
|# 		   	      
 		   	      
;; 		   	      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:::;::;;;;
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:::;::;;;:
;;; Computer exercise 7: A good hacker could defuse this situation ;;;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:::;::;;:;
;; 		   	      
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;; 		   	      
(define (make-bomb name location power) 		   	      
  (let ((aware-part (make-aware-thing))
        (mobile-part (make-mobile-thing name location))
        (armed #f))
    (lambda (msg) 		   	      
      (case msg 		   	      
	((BOMB?) (lambda (self) #t))
        ((POWER) (lambda (self) power))
        ((ARM) (lambda (self) (set! armed #t)))
        ((DISARM) (lambda (self) (set! armed #f)))
        ((ARMED?) (lambda (self) armed))
        ((TRIGGER)
         (lambda (self)
           (if (ask self 'ARMED?)
               (ask self 'ACTIVATE))))
        ((HEARD-NOISE)
         (lambda (self who)
           (if (ask self 'ARMED?)
               (ask screen 'TELL-ROOM (ask self 'LOCATION)
                    (list (ask who 'NAME) "triggered the bomb" (ask self 'NAME))))
           (ask self 'TRIGGER)))
        ((ACTIVATE)
         (lambda (self)
           (cond ((not (ask self 'ARMED?))
                  (error "Bomb" (ask self 'NAME) "tried to activate while not armed")) ; Don't activate a bomb if not armed, either disarmed (time-bomb), or possible error overriding trigger 
                 (else 
                  (ask screen 'TELL-ROOM (ask self 'LOCATION)
                       (list "Click..." #\newline "The bomb" (ask self 'NAME) "got activated"))
                 (let* ((room (ask self 'LOCATION))
                        (things (ask room 'THINGS))
                        (people (myfilter (lambda (x) (is-a x 'PERSON?)) things))
                        (current-power (ask self 'POWER))) ; Power is fixed, but this allows variable power, e.g, random
                   (for-each
                    (lambda (person)
                (ask person 'SUFFER current-power))
                    people))
                 (ask self 'DESTROY)
                 )
                 )))
        (else (find-method msg aware-part mobile-part)))))) 		   	      

(define (create-bomb name location power)
  (create make-bomb name location power)) 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:::;::;;::
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;; 		   	      

#|
The methods other than trigger, heard noise, activate are trivial
Bomb has an aware part and a mobile part so that it listens to people moving into the room
  and it can be moved

When triggered, if it is armed, it explodes
When it hears a noise, i.e, someone enters the room
  then it first notices everyone if it is armed, so that others know who activated the bomb
  and then it triggers the bomb
When activated, (unless the bomb is armed, which shouldn't happen, so it is an error)
   it notices everyone in the room that the bomb is exploding, then it damages everyone in the room
   based on the power of the bomb,
   then it destroys itself
|#
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:::;::;:;;
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;
#|
...
lambda-man triggered the bomb C4 
Click...
 The bomb C4 got activated
...
Click... 
 The bomb steaky got activated 
At dorms ben-bitdiddle says -- Ouch! 5 hits is more than I want! 
At dorms ben-bitdiddle says -- SHREEEEK!  I, uh, suddenly feel very faint... 
An earth-shattering, soul-piercing scream is heard... 
At dorms caner says -- Ouch! 5 hits is more than I want! 
At dorms caner says -- SHREEEEK!  I, uh, suddenly feel very faint... 
An earth-shattering, soul-piercing scream is heard... 
You reincarnated back in dorms with 2 lives remaining destroyed
...
 |#		   	      
;; 		   	      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:::;::;:;:
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:::;::;::;
;;;; Computer exercise 8: Well, maybe only if they have enough time ;;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:::;::;:::
;; 		   	      
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;; 		   	      
(define (make-bomb-with-timer name location power)
  (let ((bomb-part (make-bomb name location power))
        (default-time 3)
        (rem-time 0)
        (triggered #f)
        (callback-name 'timed-bomb-callback))
    (lambda (msg) 		   	      
      (case msg
	((BOMB-WITH-TIMER?) (lambda (self) #t))
        ((TIME-TO-ACTIVATE) (lambda (self) default-time))
        ((REMAINING-TIME) (lambda (self) rem-time))
        ((TRIGGERED?) (lambda (self) triggered))
        ((DISARM)
         (lambda (self)
           (set! armed #f)
           (if (ask self 'TRIGGERED?)
               (begin
                 (set! triggered #f)
                 (set! rem-time 0)
                 (ask-clock 'REMOVE-CALLBACK self callback-name)))))
        ((TRIGGER)
         (lambda (self)
           (if (and (ask self 'ARMED?) (not (ask self 'TRIGGERED?)))
               (begin
                 (ask screen 'TELL-ROOM (ask self 'LOCATION)
                      (list "The bomb" (ask self 'NAME) "got triggered" #\newline "It will blow in" (ask self 'TIME-TO-ACTIVATE)))
                 (set! triggered #t)
                 (set! rem-time (ask self 'TIME-TO-ACTIVATE))
                 (ask clock 'ADD-CALLBACK (make-clock-callback callback-name self 'BOMB-TICK))
                 ))))
        ((BOMB-TICK)
         (lambda (self)
           (set! rem-time (- rem-time 1))
           (cond ((<= rem-time 0) (ask self 'ACTIVATE))
                 (else (ask screen 'TELL-ROOM (ask self 'LOCATION)
                            (list "Bomb" (ask self 'NAME) "will blow up in" (ask self 'REMAINING-TIME)))))
           ))
        ((ACTIVATE)
         (lambda (self)
           (ask clock 'REMOVE-CALLBACK self callback-name)
           (delegate bomb-part self 'ACTIVATE)))
        (else (find-method msg bomb-part)))))) 		   	      

(define (create-bomb-with-timer name location power)
  (create make-bomb-with-timer name location power))  		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:::;:::;;;
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;; 		   	      
 		   	      
#|
Bomb with timer is the version of bomb that activates a timer when triggered
Unless disarmed before the timer stops, it activates and damages everyone while destroying itself
It can be disarmed before exploding
Then timer stops and it resets its state
If it is not disarmed, then it ticks and reports remaning seconds until it explodes
|#
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:::;:::;;:
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;; 		   	      
#|
...
lambda-man triggered the bomb tbomb5 
The bomb tbomb5 got triggered 
 It will blow in 3 
...
--- the-clock Tick 0 --- 
Bomb tbomb5 will blow up in 2 
...
ben-bitdiddle triggered the bomb tbomb6 
The bomb tbomb6 got triggered 
 It will blow in 3 
...
--- the-clock Tick 1 --- 
Bomb tbomb6 will blow up in 2 
Bomb tbomb5 will blow up in 1 
...
--- the-clock Tick 2 --- 
Bomb tbomb6 will blow up in 1 
Click... 
 The bomb tbomb5 got activated 
...
akame moves from student-center to suzy-cafe 
akame triggered the bomb tbomb4 
The bomb tbomb4 got triggered 
 It will blow in 3
...
--- the-clock Tick 3 --- 
Bomb tbomb4 will blow up in 2 
Click... 
 The bomb tbomb6 got activated 
...
...
The bomb tbomb3 got triggered 
 It will blow in 3 
...
--- the-clock Tick 6 --- 
Bomb tbomb3 will blow up in 2 
Bomb tbomb1 will blow up in 2 
...
--- the-clock Tick 7 --- 
Bomb tbomb3 will blow up in 1
Bomb tbomb1 will blow up in 1 
...
--- the-clock Tick 8 ---
Click...
 The bomb tbomb3 got activated
Click...
 The bomb tbomb1 got activated 
At graduation-stage akame says -- Ouch! 10 hits is more than I want! 
At graduation-stage akame says -- SHREEEEK!  I, uh, suddenly feel very faint... 
At graduation-stage akame says -- I lose diploma 
At graduation-stage akame says -- Yaaaah! I am upset!
An earth-shattering, soul-piercing scream is heard... 
...
--- the-clock Tick 9 --- done
|#
 		   	      
 		   	      
;; 		   	      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;;;::;;;;
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;;;::;;;:
;;;;;;;;; Computer Exercise 9: Even you can change the world! ;;;;;;;;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;;;::;;:;
 		   	      
		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;;;::;;::
;;;;;;;;;;;;; DESCRIPTION: ;;;;;;;;;;;;;
;;
#|
Classes:

Person With Magicka
-------------------
Description: Person with magicka is an enlightened version of user that has magicka, which is a type of
              energy used mainly for casting magic, and regerenerates magicka every tick
Inherits: Person
Internal State: Max Magicka, Current Magicka, Magicka Regen
Methods: Person With Magicka?, Install, Max Magicka, Magicka, Magicka Regen, Regen Tick. Suffer To Soul, Use Magicka, Die
              (Extends Install and Die)
Demonstration: With creating a person with magicka, and using his methods

Skill
-----
Description: A skill is a named thing that has a mana cost and an action that can be applied on a target by the skill user
Inherits: Named Thing
Internal State: Mana Cost, Effect
Methods: Skill?, Magicka Cost, Effect, Cast
 Cast Method applies the effect on the target, from the user's perspective, and uses user's mana
Demonstration: From magician-avatar and autonomous-magician class' magic usage

Fireball, Manaburn, Push Person are example skills defined here
Lighting, Eat Person, Useless are more examples given in setup

Magician
--------
Description: A magician is a person with magicka that can learn, forget, use skills
Inherits: Person with Magicka
Internal State: Skill Container (learnt skills)
Methods: Magician?, Skills, Knows Skill?, Get Skill, Learn Skill, Forget Skill,
          Use Skill On, Use Skill Self

We were told to not directly change original avatar or autonomous person (unlike person changed above)
So i used modified versions below with modified name, and some of the content from the original

Magician Avatar (Modified version of Avatar that inherits Magician)
---------------
Description: A avatar for the player playing the game, that inherits magician,
               so it can use skills just like a magician, and can see own skills by
               looking around
Inherits: Magician
Internal State:
Methods: Look around is changed, minor corrections for magician in others (diff from original avatar)
Demonstration: By making the me a magician avatar, and playing the game

Autonomous Magician (Modified version of Autonomous Magician that inherits Magician)
-------------------
Description: An autonomous magician is a magician that is controlled by the computer,
               so its a NPC (non player character), and acts randomly
             Autonomous magician can move and cast spells on others or self
Inherits: Magician
Internal State: Self Cast Probability (The probability that the spell is cast on self)
Methods: Autonomous Magician?, Install, Move and Cast Magic, Die, Move Somewhere, Cast Magic, Cast Magic Self
Demonstration: By observing the autonomous people in deity mode

|#
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;;;::;:;;
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;;
(define (make-person-with-magicka name birthplace initial-max-magicka initial-magicka-regen) ; Symbol, Location, Number, Number -> Person With Magicka
  (let ((person-part (make-person name birthplace))
        (max-magicka initial-max-magicka)
        (magicka initial-max-magicka)
        (magicka-regen initial-magicka-regen))
    (define (set-magicka! self amount)
      (set! magicka
            (cond ((> amount (ask self 'MAX-MAGICKA)) (ask self 'MAX-MAGICKA))
                  ((< amount 0) 0)
                  (else amount))))
    (lambda (message) 		   	      
      (case message
        ((PERSON-WITH-MAGICKA?) (lambda (self) #t))
        ((INSTALL)
         (lambda (self)
           (ask clock 'ADD-CALLBACK
                (make-clock-callback 'regen-tick-callback self 'REGEN-TICK))
           (delegate person-part self 'INSTALL)))
        ((MAX-MAGICKA) (lambda (self) max-magicka))
        ((MAGICKA) (lambda (self) magicka))
        ((MAGICKA-REGEN) (lambda (self) magicka-regen))
        ((REGEN-TICK)
         (lambda (self)
           (let ((init-magicka (ask self 'MAGICKA)))
             (set-magicka! self (+ init-magicka (ask self 'MAGICKA-REGEN)))
             (if (> (- magicka init-magicka) 0)
                 (ask self 'SAY (list "Yeey, I restored" (- magicka init-magicka) "magicka"))))))
        ((SUFFER-TO-SOUL)
         (lambda (self magicka-damage)
           (ask screen 'TELL-ROOM (ask self 'LOCATION)
                (list "Uhhh... My soul fails tired." #\newline "I took" magicka-damage "magicka damage"))
           (set-magicka! self (- magicka magicka-damage))))
        ((USE-MAGICKA)
         (lambda (self amount)
           (cond ((> amount (ask self 'MAGICKA))
                  (ask screen 'TELL-ROOM (ask self 'LOCATION)
                       (list (ask self 'NAME) "tried to use" amount "magicka, but failed to do so"))
                  #f)
                 (else
                  (set-magicka! self (- magicka amount))
                  #t))))
        ((DIE)
         (lambda (self)
           (set-magicka! self (ask self 'MAX-MAGICKA))
           (delegate person-part self 'DIE)))
	(else (find-method message person-part))))))

(define (create-person-with-magicka name birthplace initial-max-magicka initial-magicka-regen)
  (create make-person-with-magicka name birthplace initial-max-magicka initial-magicka-regen))

(define (make-skill name magicka-cost effect) ; Symbol, Number, Procedure<Person, Person> -> Skill
  (let ((named-part (make-named-object name)))
    (lambda (message)
      (case message
        ((SKILL?) (lambda (self) #t))
        ((MAGICKA-COST) (lambda (self) magicka-cost))
        ((EFFECT) (lambda (self) effect))
        ((CAST)
         (lambda (self user target)
           (cond ((not (is-a user 'PERSON-WITH-MAGICKA?))
                  (ask screen 'TELL-ROOM (ask user 'LOCATION)
                       (list (ask user 'NAME) "tried to cast a spell, but as a magickaless person, he fails horribly and damages himself."))
                  (ask user 'SUFFER 1))
                 ((not (ask user 'USE-MAGICKA (ask self 'MAGICKA-COST)))
                  (ask screen 'TELL-ROOM (ask user 'LOCATION)
                       (list (ask user 'NAME) "tried to cast a spell, but didn't have enough magicka. He just fails.")))
                 (else ((ask self 'EFFECT) user target)))))
        (else (find-method message named-part))))))

(define fireball-skill
  (make-skill 'fireball 30
              (lambda (user target)
                (ask user 'SAY (list "Burn" (ask target 'NAME)))
                (ask target 'SUFFER 10))))
(define manaburn-skill
  (make-skill 'manaburn 20
              (lambda (user target)
                (if (is-a target 'PERSON-WITH-MAGICKA?)
                    (ask target 'SUFFER-TO-SOUL 20)
                    (ask target 'SAY "I don't have any magicka, you can't damage my non-existant soul.")))))
(define push-person-skill
  (make-skill 'push-person 10
              (lambda (user target)
                (if (null? (ask (ask target 'LOCATION) 'EXITS))
                    (ask screen 'TELL-ROOM (ask user 'LOCATION)
                         (list (ask user 'NAME) "tried to use push skill on" (ask target 'NAME) ", but cannot push him to anywhere"))
                    (let ((exit (random-exit (ask target 'LOCATION))))
                      (ask screen 'TELL-ROOM (ask user 'LOCATION)
                         (list (ask user 'NAME) "used push skill on" (ask target 'NAME)))
                      (ask exit 'USE target))))
                ))

(define (make-magician name birthplace initial-max-magicka initial-magicka-regen) 
  (let ((person-with-magicka-part (make-person-with-magicka name birthplace initial-max-magicka initial-magicka-regen))
        (skill-container (make-container)))
    (lambda (message) 		   	      
      (case message
        ((MAGICIAN?) (lambda (self) #t))
        ((SKILLS) (lambda (self) (ask skill-container 'THINGS)))
        ((KNOWS-SKILL?)
         (lambda (self skill-name)
           (not (null? (myfilter
                        (lambda (obj) (eq? (ask obj 'NAME) skill-name))
                        (ask self 'SKILLS))))))
        ((GET-SKILL)
         (lambda (self skill-name)
           (let ((filter-result
                  (myfilter
                   (lambda (obj) (eq? (ask obj 'NAME) skill-name))
                   (ask self 'SKILLS))))
             (if (null? filter-result)
                 #f
                 (car filter-result)))))
        ((LEARN-SKILL)
         (lambda (self skill)
           (cond ((not (is-a skill 'SKILL?))
                  (ask self 'SAY
                       (list "I cannot learn" (ask skill 'NAME) ", it is not a skill!")))
                 ((ask self 'KNOWS-SKILL? (ask skill 'NAME))
                  (ask self 'SAY
                       (list "I already know that skill")))
                 (else
                  (ask self 'SAY (list "Yihaa, I now know" (ask skill 'NAME)))
                  (ask skill-container 'ADD-THING skill)))))
        ((FORGET-SKILL)
         (lambda (self skill-name)
           (cond ((not (ask self 'KNOWS-SKILL? skill-name))
                  (ask self 'SAY
                       (list "I cannot forget what I don't know :(")))
                 (else (ask skill-container (ask self 'GET-SKILL skill-name))))))
        ((USE-SKILL-ON)
         (lambda (self skill-name target)
           (cond ((not (ask self 'KNOWS-SKILL? skill-name))
                  (ask self 'SAY (list "I cannot cast" skill-name ", I don't know that skill")))
                 (else
                  (ask self 'SAY (list "I use" skill-name "on" (ask target 'NAME)))
                  (ask (ask self 'GET-SKILL skill-name) 'CAST self target)
                  'cast))))
        ((USE-SKILL-SELF)
         (lambda (self skill-name)
           (ask self 'USE-SKILL-ON skill-name self)))
        (else (find-method message person-with-magicka-part skill-container))))))

(define (create-magician name birthplace initial-max-magicka initial-magicka-regen)
  (create make-magician name birthplace initial-max-magicka initial-magicka-regen))

(define (make-magician-avatar name birthplace initial-max-magicka initial-magicka-regen)
  (let ((magician-part (make-magician name birthplace initial-max-magicka initial-magicka-regen)))
    (lambda (message) 		   	      
      (case message 		   	      
	((AVATAR?) (lambda (self) #T))
        ((MAGICIAN-AVATAR?) (lambda (self) #T))
	((LOOK-AROUND)		; report on world around you
	 (lambda (self) 		   	      
	   (let* ((place (ask self 'LOCATION))
		  (exits (ask place 'EXITS))
		  (other-people (ask self 'PEOPLE-AROUND))
		  (my-stuff (ask self 'THINGS))
                  (my-skills (ask self 'SKILLS))
		  (stuff (ask self 'STUFF-AROUND)))
	     (ask screen 'TELL-WORLD (list "You are in" (ask place 'NAME)))
	     (ask screen 'TELL-WORLD
	      (if (null? my-stuff)
		  '("You are not holding anything.")
		  (append '("You are holding:") (names-of my-stuff))))
	     (ask screen 'TELL-WORLD
	      (if (null? stuff)
		  '("There is no stuff in the room.")
		  (append '("You see stuff in the room:") (names-of stuff))))
             (ask screen 'TELL-WORLD
                  (if (null? my-skills)
                      '("You don't know any skills")
                      (append '("You know the skills:") (names-of my-skills))))
             (ask screen 'TELL-WORLD
	      (if (null? other-people)
		  '("There are no other people around you.")
		  (append '("You see other people:") (names-of other-people))))
	     (ask screen 'TELL-WORLD
	      (if (not (null? exits))
		  (append '("The exits are in directions:") (names-of exits))
		  ;; heaven is only place with no exits
		  '("There are no exits... you are dead and gone to heaven!")))
	     'OK))) 		   	      
 		   	      
	((GO) 		   	      
	 (lambda (self direction)  ; Shadows person's GO
	   (let ((success? (delegate magician-part self 'GO direction)))
	     (if success? 		   	      
                 (begin (ask clock 'TICK)
                        (ask self 'LOOK-AROUND)));;I changed this line to look around.
	     success?))) 		   	      
	((GET) 		   	      
	 (lambda (self tname) 		   	      
	   (let ((objs (myfilter (lambda (x) (eq? (ask x 'name) tname))
			       (ask (ask self 'location) 'things))))
	     (if (null? objs) 		   	      
		 (ask self 'say `(I do not see a ,tname here))
		 (ask self 'take (car objs))))))
	((TOSS) 		   	      
	 (lambda (self tname) 		   	      
	   (let ((objs (myfilter (lambda (x) (eq? (ask x 'name) tname))
			       (ask self 'things))))
	     (if (null? objs) 		   	      
		 (ask self 'say `(I do not have a ,tname))
		 (ask self 'drop (car objs))))))
	((TAKE) 		   	      
	 (lambda (self thing) 		   	      
	   (let ((thing (delegate magician-part self 'TAKE thing)))
	     (if (and (not (null? thing))
		      (eq? 'diploma (ask thing 'NAME)))
		 (ask self 'SAY '("   HURRRAY!!!!!!!!!!!!!"))))))
 		   	      
	(else (get-method message magician-part))))))
 		   	      
(define (create-magician-avatar name birthplace initial-max-magicka initial-magicka-regen)
  (create make-magician-avatar name birthplace initial-max-magicka initial-magicka-regen))

(define (make-autonomous-magician name birthplace activity initial-max-magicka initial-magicka-regen)
  (let ((magician-part (make-magician name birthplace initial-max-magicka initial-magicka-regen))
        (self-cast-probability 0.2))
    (lambda (message) 		   	      
      (case message 		   	      
	((AUTONOMOUS-MAGICIAN?) (lambda (self) #T))
	((INSTALL) (lambda (self)
		     (ask clock 'ADD-CALLBACK
			  (make-clock-callback 'move-and-cast-magic self
					       'MOVE-AND-CAST-MAGIC))
		     (delegate magician-part self 'INSTALL)))
	((MOVE-AND-CAST-MAGIC) 		   	      
	 (lambda (self) 		   	      
	   ;; first move 		   	      
	   (let loop ((moves (random-number activity)))
	     (if (= moves 0) 		   	      
		 'done-moving 		   	      
		 (begin 		   	      
		   (ask self 'MOVE-SOMEWHERE)
		   (loop (- moves 1)))))
           (if (< (random) self-cast-probability) ; Cast on self with self cast probability
               (ask self 'CAST-MAGIC-SELF)
               (ask self 'CAST-MAGIC))
	   ;; then take stuff 		   	      
	   'done-for-this-tick))
	((DIE) 		   	      
	 (lambda (self) 		   	      
	   (ask clock 'REMOVE-CALLBACK self 'MOVE-AND-CAST-MAGIC)
	   (delegate magician-part self 'DIE)))
	((MOVE-SOMEWHERE) 		   	      
	 (lambda (self) 		   	      
	   (let ((exit (random-exit (ask self 'LOCATION))))
	     (if (not (eqv? #f exit)) (ask self 'GO-EXIT exit)))))
        ((CAST-MAGIC)
         (lambda (self)
           (let ((other-people (ask self 'PEOPLE-AROUND))
                 (known-skills (ask self 'SKILLS)))
             (if (not (or (null? other-people) (null? known-skills)))
                 (let ((target (pick-random other-people))
                       (skill (pick-random known-skills)))
                   (ask self 'use-skill-on (ask skill 'NAME) target))))))
        ((CAST-MAGIC-SELF)
         (lambda (self)
           (let ((known-skills (ask self 'SKILLS)))
             (if (not (null? known-skills))
                 (let ((skill (pick-random known-skills)))
                   (ask self 'use-skill-on (ask skill 'NAME) self))))))
	(else (get-method message magician-part))))))

(define (create-autonomous-magician name birthplace activity initial-max-magicka initial-magicka-regen)
  (create make-autonomous-magician name birthplace activity initial-max-magicka initial-magicka-regen))

;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;;;::;:;:
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;;

#|
make-person-with-magicka creates a person with magicka, so it inherits person
    and has magicka related attributes, and appropriate getters for those attributes
  At install, it adds a callback for the magicka regen at each tick
  In suffer to soul, one receives magicka damage, it doesn't affect health, but decreases magicka
  In use magicka, if one has enough magicka, it uses it and returns true,
     if one doesn't have enough magicka, it reports it, doesn't use magicka and returns false

---

make-skill creates a skill with given name, magicka cost and effect
  It has getters for magicka cost and effect
  In cast, it checks if the caster is a person with magicka, and if it is not true, it damages
     the user as a mere person without magicka shouldn't cast spells, or even touch them at all
     Currently a user cannot learn spells, but can cast if the cast method is directly called with a user
     If the caster doesn't have enough magicka, he is notified but nothing happens
     If all conditions met, then the spell is cast

---

Fireball, manaburn, push-person are 3 generic predefined skill, more can be (and actually) defined in setup

- Fireball does damage and makes the user say Burn {Target}

- Manaburn does magicka damage to the target if the target has magicka, does nothing otherwise

- Push person pushes a person to a random exit in the current room, so the person is forced to change location

---

make-magician creates a magician, that inherits person with magicka, that can learn and use spelss
   It has a skill container for learned skills
   It has appropriate methods for the container, Skills, Knows Skill and Get Skill
     which returns all skills, checks whether the user knowns a skill from name and gets a skill object from name (in given order)
   Learn skill first checks whether the given object is a skill and reports otherwise
     It then checks whether the user already knowns the skill, and reports if he knows
     Then it adds the skill to the container
   Forget skill makes the person forget a skill from the name of the skill, and reports
     if the user doens't know the skill
   Use skill on casts the given spell (from name) on the target
     using the skills Cast method, if the user knows the skill, magicka usage
     is handled by the spell's Cast method.
     If the user doesn't know the skill, it just makes the person say i can't do that
   Use skill self casts the self on this person himself

---

make-magician-avatar creates a controllable avatar that is a magician
   Look around now also reports the known skills

---

make-autonomous-magician is an autonomous character, a NPC, that can learn and use magic
  It doesn't learn magic by itself, so it can only use spells he knows from start, or made learned
   by someone else, calling 'learn-skill on the character
  In install, it adds the timer for move and cast magic
  Unlike regular autonomous people, autonomous magician doens't pick stuff up, however
   the autonomous magicians are quite angry, and likes to cast magic so it casts magic
   every tick
  In move and cast magic, it casts the magic on self based on a probability (1/5),
    otherwise it casts it on a random target in the room
  If it doens't know a skill, or there is no target (and not casting on self), it casts a random
    magic it knowns to a random person in the room


|#
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;;;::;::;
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;;
; Learning/Using Skills
#|
> (setup 'caner)
ready
> (ask screen 'deity-mode #f)
> (ask me 'learn-skill fireball-skill)
At library caner says -- Yihaa, I now know fireball done
> (ask me 'learn-skill push-person-skill)
At library caner says -- Yihaa, I now know push-person done
> (ask me 'look-around)
...
You know the skills: push-person fireball 
You see other people: lambda-man 
...
> (ask me 'use-skill-on 'fireball (thing-named 'lambda-man))

At great-court caner says -- I use fireball on lambda-man 
At great-court caner says -- Burn lambda-man 
At great-court lambda-man says -- Ouch! 10 hits is more than I want! 
At great-court lambda-man says -- SHREEEEK!  I, uh, suddenly feel very faint... 
At great-court lambda-man says -- I lose sicp-book 
At great-court lambda-man says -- Yaaaah! I am upset! 
An earth-shattering, soul-piercing scream is heard... cast

...

> (ask me 'use-skill-on 'push-person (thing-named 'suzy))

At suzy-cafe caner says -- I use push-person on suzy 
caner used push skill on suzy 
suzy moves from suzy-cafe to bookstore cast

> (run-clock 1)

At suzy-cafe caner says -- Yeey, I restored 10 magicka 
...
--- the-clock Tick 2 --- done
|#		   	      

; Autonomous magicians
#|
At migros raistlin says -- Yihaa, I now know lighting 
At dorms duygu says -- Yihaa, I now know eat-person 
...
At great-court duygu says -- I use useless on comp200-student 
At great-court duygu says -- I am useless. 
At great-court comp200-student says -- Yes, you are 
...
At great-court duygu says -- Yeey, I restored 5 magicka
...
At eng-b30 raistlin says -- I use lighting on raistlin 
At eng-b30 raistlin says -- Ouch! 10 hits is more than I want!
...
At eng-auditorium raistlin says -- I use lighting on duygu 
At eng-auditorium duygu says -- Ouch! 10 hits is more than I want! 
...
At cas-building duygu says -- Hi akame 
At cas-building duygu says -- I use eat-person on akame 
At cas-building duygu says -- Ouch! 1 hits is more than I want! 
At cas-building akame says -- Ouch! 2 hits is more than I want!
...

|#
;; 		   	      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;;;::;:::
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;;;:::;;;
;# DO NOT FORGET TO SUBMIT YOUR WORK BEFORE THE DEADLINE!         #
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;;;:::;;:
;# GOOD LUCK!                                                     #
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;:;::;;;;
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
