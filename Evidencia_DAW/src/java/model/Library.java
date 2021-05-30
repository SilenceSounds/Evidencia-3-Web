/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
//librerías utilizadas
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jesgu
 */
public class Library {
    //El atributo de la lista de objetos Book
    private List<Book> books = new ArrayList<>();
    /*
      En seguida están los atributos de todos los libros,
      al no tener una base de datos, los instanciamos aquí  
    */
    String [] id = {"1","2","3","4","5","6","7","8","9","10","11","12"};
    String [] titles = {"Harry Potter y la piedra filosofal",
                        "El señor de los anillos: La comunidad del anillo", 
                        "Las crónicas de Narnia: El viajero del alba",
                        "Donde los árboles cantan", 
                        "Libro salvaje", 
                        "El quinto dragón",  
                        "La naranja mecánica", 
                        "Crimen y castigo", 
                        "1984", 
                        "La Odisea",
                        "Orgullo y prejuicio",
                        "Los gatos de Ulthar"};
    //Links de las imágenes de portada
    String [] covers = {"https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fstatic3.businessinsider.com%2Fimage%2F511cffe5eab8ea1355000012-948-1445%2Fnew%2520harry%2520potter%2520cover.jpg&f=1&nofb=1",
                        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages-na.ssl-images-amazon.com%2Fimages%2FI%2F91rq1j7GYhL.jpg&f=1&nofb=1", 
                        "https://www.elsotano.com/imagenes_grandes/9788408/978840806267.JPG",
                        "https://images-na.ssl-images-amazon.com/images/I/91gYns+sNGL.jpg",
                        "https://cdn.gandhi.com.mx/media/catalog/product/i/m/image_1165_1_66236.jpg",
                        "https://www.normainfantilyjuvenil.com/co/uploads/2019/01/9789580000112.jpg",
                        "https://www.librosyliteratura.es/wp-content/uploads/2014/11/la-naranja-mecanica.jpg",
                        "https://www.alianzaeditorial.es/imagenes/libros/grande/9788420675947-crimen-y-castigo.jpg",
                        "https://idolosolvidados.com/wp-content/uploads/2014/03/81WunXo0giL.jpg",
                        "https://www.loqueleo.com/bo/uploads/2016/12/resized/800_la-odisea.jpg",
                        "https://images-na.ssl-images-amazon.com/images/I/71EEWVApVZL.jpg",
                        "https://3.bp.blogspot.com/-1N5YBkxpC68/WVeKpi5KDkI/AAAAAAAABTA/fjo6PLqkLLQnw8w5cTM5rmd5VRg9WrzEwCLcBGAs/s1600/Los%2Bgatos%2Bde%2Bulthar.jpg"
                        };
    String [] desc ={"Fantasía",
                    "Fantasía épica", 
                    "Fantasía" , 
                    "Realismo mágico" , 
                    "Relatos de aventura", 
                    "Ficción moderna y contemporánea", 
                    "Ficción moderna y contemporánea", 
                    "Ficción clásica", 
                    "Ficción clásica", 
                    "Literatura clásica",
                    "Ficción clásica",
                    "Cuento"
                    };
    String [] sinopsis ={"Harry Potter nunca ha oído hablar de Hogwarts cuando en el felpudo del número 4 de Privet Drive empieza a caer una lluvia de sobres de pergamino amarillento, con la dirección escrita con tinta verde y un sello de lacre púrpura. Y aunque los horribles tíos de Harry se apresuran a confiscar las cartas el día que Harry cumple once años un hombre gigantesco llamado Rubeus Hagrid, cuyos ojos brillan como escarabajos negros, irrumpe con una noticia extraordinaria: Harry Potter es un mago, y le han concedido una plaza en el Colegio Hogwarts de Magia y Hechicería. ¡Una aventura increíble está a punto de comenzar!",
                         "En la adormecida e idílica Comarca, un joven hobbit recibe un encargo: custodiar el Anillo Único y emprender el viaje para su destrucción en las Grietas del Destino. Consciente de la importancia de su misión, Frodo abandona la Comarca e inicia el camino hacia Mordor con la compañía de inesperada de Sam, Pippin y Merry.  Pero sólo con la ayuda de Aragorn conseguirán vencer a los Jinetes Negros y alcanzar el refugio de la Casa de Elrond en Rivendel." ,
                         "Un viaje al auténtico fin del mundo, donde múltiples profecías se verán cumplidas un rey y unos inesperados compañeros de viaje emprenden una travesía que los llevara más allá de toda tierra conocida a medida que navegan por mares que no aparecen en los mapas, descubren que su fusión es más arriesgada de lo que habían imaginado y que el fin del mundo es, en realidad, el umbral de una tierra incógnita", 
                         "Viana, la única hija del duque de rocagrís, está prometida al joven Robian de Castelmar desde que ambos eran niños. Los dos se aman y se casarán en primavera. Sin embargo, durante los festejos del solsticio de invierno, un arisco montaraz advierte al rey de nortia y sus caballeros de la amenaza de los bárbaros de las estepas... Y tanto Robian como el duque se ven obligados a marchar a la guerra. En tales circunstancias, una doncella como Viana no puede hacer otra cosa que esperar su regreso... Y, tal vez, prestar atención a las leyendas que se cuentan sobre el gran bosque... El lugar donde los árboles cantan.", 
                         "Juan ya tiene planeadas la vacaciones de verano. Sin embargo, su madre ignora sus planes y lo deja en casa de tío tito, un bibliófilo empedernido que hace ruido cuando come y que le teme a los osos de peluche. Ahí, escondido entre los miles ejemplares de la biblioteca de su tío, juan tendrá que encontrar el libro salvaje, un libro rebelde que se resiste a la lectura y que guarda entre sus páginas un secreto destinado al lector que sea capaz de atraparlo.", 
                         "Cuando Abi llega a Puerto Esmeralda no logra recordar quién es ni de dónde viene, pero la abuela, a quien todos en el pueblo catalogan de bruja, la adopta como su nieta y le da un nombre. Abi se acostumbra a la abuela, a las calurosas tardes en las Islas, a las mágicas leyendas de los Kichéh y a los juegos con sus amigos Matilde y Sebastián; pero sus días tranquilos terminan con la llegada de Jan y el descubrimiento de un don fantástico que le revelará su verdadera esencia. Ahora Abi y Jan tendrán que descubrir hasta dónde están ligadas sus existencias. Esta novela tiene una sólida estructura en la que las voces de los personajes van tejiendo una magnífica historia que salta de la realidad a la fantasía. En palabras de Francisco Hinojosa es una magnífica novela que se lee de corrido.", 
                         "La naranja mecánica cuenta la historia del nadsat-adolescente Alex y sus tres drugos-amigos en un mundo de crueldad y destrucción. Alex tiene, según Burgess, 'los principales atributos humanos; amor a la agresión, amor al lenguaje, amor a la belleza. Pero es joven y no ha entendido aún la verdadera importancia de la libertad, la que disfruta de un modo tan violento. En cierto sentido vive en el Edén, y sólo cuando cae (como en verdad le ocurre, desde una ventana) parece capaz de llegar a transformase en un verdadero ser humano.' En 1971 Stanley Kubrick llevó al cine este relato.", 
                         "Considerada por la crítica como la primera obra maestra de Dostoievski, Crimen y castigo es un profundo análisis psicológico de su protagonista, el joven estudiante Raskólnikov, cuya firme creencia en que los fines humanitarios justifican la maldad le conduce al asesinato de una usurera. Pero, desde que comete el crimen, la culpabilidad será una pesadilla constante con la que el estudiante será incapaz de convivir.", 
                         "En el año 1984 Londres es una ciudad lúgubre en la que la policía del pensamiento controla de forma asfixiante la vida de los ciudadanos. Winston Smith es un peón de este engranaje perverso, su cometido es reescribir la historia para adaptarla a lo que el partido considera la versión oficial de los hechos hasta que decide replantearse la verdad del sistema que los gobierna y somete.", 
                         "Una vez terminada la guerra de Troya, Ulises emprende el regreso a Ítaca donde lo esperan su hijo Telémaco y su fiel esposa Penélope. El viaje se alargará diez interminables años durante los cuales el héroe griego y sus compañeros sufren toda suerte de desventuras. Solo la astucia ayudará a Ulises a llegar sano y salvo a su patria.",
                         "ORGULLO Y PREJUICIO es la obra que consagró a Jane Austen como la novelista del prerromanticismo inglés. La aparición en Longbourn, un pueblo de la campiña inglesa, de Charles Bingley, joven, soltero y rico, despierta las ambiciones de las familias del vecindario, que lo consideran un exclente partido para sus hijas. Él y su amigo Fitzwilliam Darcy, también adinerado, tendrán que luchar contra las intrigas con las que se tratará de poner trabas al amor que sienten por dos de las hermanas Bennet, pobres y modestas, antes de alcanzar un final feliz. Jane Austen retrata, con una ironía muy matizada, la psicología de la burguesía inglesa que se mueve entre hipócritas orgullos de clase y prejuicios sociales.",
                         "Mientras mira a su gato, un narrador desconocido, recuerda que en el pueblo de Ulthar existe una ley que prohíbe matar a los gatos y nos cuenta el oscuro por qué...Resulta que en Ulthar vivía una pareja de ancianos campesinos que se divertían atrapando y asesinando gatos de maneras extrañas, sin saber que destino que les esperaría.Escrito en 1920 por H.P. Lovecraft, Los gatos de Ulthar es uno de los cuentos más populares del reconocido escritor."
                         };
    String [] price ={"249.99", "259.99", "269.99", "279.99", "289.99", "299.99", "229.99", "239.99", "359.99", "149.99", "179.99", "439.99"};
    String [] author ={"J.K. Rowlling",
                        "J.R.R. Tolkien",
                        "C.S. Lewis",
                        "Laura Gallego",
                        "Juan Villoro",
                        "Paulina Aguilar Gutiérrez",
                        "Anthony Burgess",
                        "Fiódr Dostoyevski",
                        "George Orwell",
                        "Homero",
                        "Jane Austen",
                        "H.P. Lovecraft"
                        };

    /**
     * Constructor
     */
    public Library() {
        for (int i = 0; i < 12; i++) {
                Book newBook = new Book(id[i], titles[i], covers[i], desc[i], sinopsis[i], price[i], author[i]);
                this.books.add(newBook);
            }
    }

    //Getter:
    public List<Book> getBooks() {
        return books;
    }
     /**
      * Función para obtener un objeto Book de la lista de libros
      * @param id el identificador del libro que se está buscando
      * @return el libro que corresponde al id
      */
    public Book getBookById(int id){
        return this.getBooks().get(id-1);
    }
    
}
