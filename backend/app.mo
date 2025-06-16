import Int8 "mo:base/Int8";
import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Iter "mo:base/Iter";

actor SpaceStationManager {

  public type Pomieszczenie = {
    nazwa : Text;
    temperatura : Int8;
    wilgotnosc : Int8;
    tlen : Int8;
    promieniowanie : Float;
  };

  var pomieszczenia = HashMap.HashMap<Text, Pomieszczenie>(8, Text.equal, Text.hash);

  private func inicjujPomieszczenia() {
    if (pomieszczenia.size() == 0) {
      pomieszczenia.put("spiżarnia", {nazwa = "Lodówa"; temperatura = -5; wilgotnosc = 50; tlen = 21; promieniowanie = 0.1});
      pomieszczenia.put("sterownia", {nazwa = "Sterownia"; temperatura = 21; wilgotnosc = 50; tlen = 21; promieniowanie = 0.1});
      pomieszczenia.put("kajuta_b", {nazwa = "Kajuta B"; temperatura = 20; wilgotnosc = 50; tlen = 21; promieniowanie = 0.1});
    };
  };

  // Call initialization in the actor's constructor
  
    inicjujPomieszczenia();
 

  public query func getPomieszczenie(id: Text) : async ?Pomieszczenie {
    return pomieszczenia.get(id);
  };

  public query func getWszystkiePomieszczenia() : async [(Text, Pomieszczenie)] {
    return Iter.toArray(pomieszczenia.entries());
  };
}