# DESIGN GUIDELINES

- per le varie viste viene utilizzato il componente wrapper che ha il margin opzionale configurato (24 orizzontale, 16 verticale)
- per i padding si possono utilizzare tutti i multipli di 4, al di sopra del valore 8 si ragiona in multipli di 8 (4, 8, 16, 24, 32)
- la font size puo essere di
  - 32 per large title
  - 18 per bottoni e call to action
  - 14 di default
  - 12 per le caption
- il font weight è SEMPRE .w600 o al massimo se si ha bisogno di qualcosa di piu leggero .w400

- MONTSERRAT NON VIENE UTILIZZATO
- i colori sono:

  - rebeccaPurple per bottoni ed highlighting importanti
  - darkGrey per bordi di container non espansi (solo bordo), per le icone non selezionate
  - lightGrey viene utilizzato per piccoli bordi e disabled
  - primaryBlack e secondaryBlack PER TUTTI I TESTI

- ci sono solo due ombre:
- lightShadow per quando qualcosa fluttua ma non è "in faccia"
- darkShadow quando qualcosa è "in faccia"

# BUGS

- fixare errore modale: non compaiono i border radius e neanche sale a schermo intero
- verificare tutti i punti gialli all'interno delle schermate


# TODO

- aggiunge :id a product quando faccio il click sul prodotto
- aggiungere sezione per creare un gruppo di favoriti
