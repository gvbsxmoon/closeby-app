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

# TODO

- aggiunge :id a product quando faccio il click sul prodotto
- aggiungere sezione per creare un gruppo di favoriti

# AI DICE

L'utilizzo di GetX in Flutter per la navigazione tra le pagine è molto flessibile e potente, ma è importante considerare la sicurezza della tua applicazione durante la navigazione tra le pagine. Quando usi Get.toNamed('/nuovaPagina') per navigare a una nuova pagina, potenzialmente esiste il rischio che l'utente possa tornare indietro alla pagina di login se non si gestisce correttamente la navigazione.

Per evitare che l'utente possa tornare indietro alla pagina di login dopo essersi autenticato, puoi adottare alcune pratiche consigliate:

Rimuovi la pagina di login dalla "storia" di navigazione:
Dopo aver effettuato l'accesso con successo, puoi rimuovere la pagina di login dalla storia di navigazione utilizzando Get.offAllNamed('/nuovaPagina') anziché Get.toNamed('/nuovaPagina'). In questo modo, l'utente non potrà tornare indietro alla pagina di login utilizzando il pulsante indietro del dispositivo.
dart
Copy code
// Dopo l'accesso con successo, rimuovi la pagina di login dalla storia di navigazione.
Get.offAllNamed('/nuovaPagina');
Utilizza autenticazione e autorizzazione:
Implementa un sistema di autenticazione e autorizzazione robusto nella tua app per garantire che solo gli utenti autenticati possano accedere alle pagine protette. Puoi farlo utilizzando librerie di gestione dell'autenticazione come Firebase Authentication o implementando una soluzione personalizzata.
Utilizza interceptor o middleware:
Puoi utilizzare gli interceptor di GetX per gestire la navigazione in modo più dettagliato e controllato. Ad esempio, puoi intercettare le richieste di navigazione verso la pagina di login e reindirizzare l'utente a una pagina diversa se sono già autenticati.
dart
Copy code
GetMaterialApp(
initialRoute: '/login',
getPages: [
GetPage(name: '/login', page: () => LoginPage()),
GetPage(name: '/nuovaPagina', page: () => NuovaPagina()),
],
defaultTransition: Transition.fade,
navigatorKey: Get.key,
initialBinding: AuthBindings(), // Associa il binding all'autenticazione
onGenerateRoute: (settings) {
if (AuthController.to.isAuthenticated) {
// Utente autenticato, consenti la navigazione.
return null;
} else {
// Utente non autenticato, reindirizza alla pagina di login.
return GetRouteBase(settings.name, page: () => LoginPage());
}
},
);
Assicurati di adattare queste soluzioni alle esigenze specifiche della tua app e di implementare adeguatamente il controllo di accesso e l'autenticazione in modo sicuro.
