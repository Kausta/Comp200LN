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
           (if (not (eq? (ask person 'LOCATION) (ask target 'LOCATION))) (error "Cannot attack a person in another room!")) ; Check whether they are in the same room
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
					       'DECIDE-ATTACK))
		     (delegate autonomous-player-part self 'INSTALL)))
        ((VIOLENCE-FREQUENCY) (lambda (self) violence-frequency))
        ((ATTACK-CHANCE) (lambda (self) (/ 1 (ask self 'VIOLENCE-FREQUENCY))))
	((DECIDE-ATTACK) 		   	      
	 (lambda (self) 		   	      
           (if (< (random) (ask self 'ATTACK-CHANCE)) ; If it is decided that violent player wants to attack
               (let ((others (ask self 'PEOPLE-AROUND)) ; Get the other people
                     (weapons (myfilter (lambda (x) (is-a x 'WEAPON?)) (ask self 'THINGS)))) ; Get all the objects and then filter the weapons (myfilter from objsys)
                 (if (not (or (null? others) (null? weapons))) ; If there is both a person and weapons (that is, it is not the case that there isn't a person or a weapons)
                     (let ((target (pick-random others))
                           (weapon (pick-random weapons)))
                       (ask self 'ATTACK weapon target))
                     )))
	   'done-for-this-tick))
        ((ATTACK)
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
           (ask self 'TRIGGER)))
        ((ACTIVATE)
         (lambda (self)
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
           ))
	(else (find-method msg aware-part mobile-part)))))) 		   	      
 		   	      
(define (create-bomb name location power)
  (create make-bomb name location power)) 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:::;::;;::
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;; 		   	      
 		   	      
your-answer-here 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:::;::;:;;
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;; 		   	      
your-answer-here 		   	      
 		   	      
 		   	      
;; 		   	      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:::;::;:;:
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:::;::;::;
;;;; Computer exercise 8: Well, maybe only if they have enough time ;;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:::;::;:::
;; 		   	      
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;; 		   	      
your-answer-here 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:::;:::;;;
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;; 		   	      
 		   	      
your-answer-here 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;::;:::;:::;;:
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;; 		   	      
your-answer-here 		   	      
 		   	      
 		   	      
;; 		   	      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;;;::;;;;
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;;;::;;;:
;;;;;;;;; Computer Exercise 9: Even you can change the world! ;;;;;;;;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;;;::;;:;
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;;;::;;::
;;;;;;;;;;;;; DESCRIPTION: ;;;;;;;;;;;;;
;; 		   	      
your-answer-here 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;;;::;:;;
;;;;;;;;;;;;; CODE: ;;;;;;;;;;;;;
;; 		   	      
your-answer-here 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;;;::;:;:
;;;;;;;;;;;;; EXPLANATION: ;;;;;;;;;;;;;
;; 		   	      
 		   	      
your-answer-here 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;;;::;::;
;;;;;;;;;;;;; TRANSCRIPT: ;;;;;;;;;;;;;
;; 		   	      
your-answer-here 		   	      
 		   	      
 		   	      
;; 		   	      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;;;::;:::
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;;;:::;;;
;# DO NOT FORGET TO SUBMIT YOUR WORK BEFORE THE DEADLINE!         #
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;;;:::;;:
;# GOOD LUCK!                                                     #
;;;;;;;::;;;::::;:;::::;:::::::;;:;::;:;::::;::;:::;;;;:::::;:;;::;;;:;::;::;;::;;;:;:::;;;;:::;;:;::;;;;
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
 		   	      
