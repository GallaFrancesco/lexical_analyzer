#lang racket

; to load into a racket interpreter run:
; (require "lexer.txt")
; the only definition provided is basic-lexer
(require parser-tools/lex)

(define basic-lexer
  (lexer
	[(repetition 1 +inf.0
				 (char-range #\a #\z))
	 ; =>
	 (cons `(ID ,lexeme)
		   (basic-lexer input-port))]

	[(repetition 1 +inf.0 #\.)
	 (cons `(POINT ,lexeme)
		   (basic-lexer input-port))]

	 [(union #\space #\newline)
	  ; =>
	  (basic-lexer input-port)]

	 [(eof)
	  ; =>
	  '()]))
; provide external interpreter with definitions
(provide basic-lexer)
