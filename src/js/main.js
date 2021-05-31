import '../sass/main.sass'
import 'bootstrap'
import '@fortawesome/fontawesome-free/css/all.min.css'
import { Elm } from '../elm/Main.elm'

Elm.Main.init({
  node: document.getElementById('main')
})
