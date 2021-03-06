# Module that makes enerbot talk
module Quote
  # Based on juanbrujo's 8ball.js
  def self.advice
    ['En mi opinión, sí',
     'Es cierto',
     'Es decididamente así',
     'Probablemente',
     'Buen pronóstico',
     'Todo apunta a que sí',
     'Sin duda',
     'Sí',
     'Sí - definitivamente',
     'Debes confiar en ello',
     'Respuesta vaga, vuelve a intentarlo',
     'Pregunta en otro momento',
     'Será mejor que no te lo diga ahora',
     'No puedo predecirlo ahora',
     'Concéntrate y vuelve a preguntar',
     'No cuentes con ello',
     'Mi respuesta es no',
     'Mis fuentes me dicen que no',
     'Las perspectivas no son buenas',
     'Muy dudoso'].sample
  end

  # Based on lgaticaq's beneficios.js
  def self.benefit
    ['Tómate la tarde libre, proletario.',
     '¡4 semanas de vacaciones pagadas!',
     'Escoje el computador y la silla que quieras.',
     'Snacks, café, frutas y bebidas libre todos los días todo el día.',
     'Aguinaldo en septiembre y diciembre.',
     'Bono anual por metas cumplidas.',
     'Seguro de salud y dental para ti y tu familia.',
     'Bono anual sólo por ser un :energon: dev',
     'Permisos para celebrar y compartir en la :energon: Conf'].sample
  end

  def self.status
    ['Trabajo muy duro, como un esclavo... :musical_note:'].sample
  end

  def self.search
    ['Revisando mi BD :buffer:',
     ':wait_energon:'].sample
  end

  def self.alert(usr, chn)
    case chn
    when /shut/
      ":newalert: <@#{usr}> tried to kill me!"
    when /\b/
      ":newalert: <@#{usr}> is making me work on <##{chn}|#{chn}>!"
    when /say/
      ":newalert: <@#{usr}> almost use a paid functionality!"
    end
  end

  def self.japanese
    ['なっ何？！',
     '«目覚め給え、我が主たちよ！»',
     '«キサマァ。。。» '].sample
  end

  def self.commit
    require 'nokogiri'
    require 'open-uri'
    doc = Nokogiri::HTML(open('http://whatthecommit.com'))
    text = doc.css('div#content p')[0].text
    ">git commit -m '#{text.chomp}'"
  end

  # Function that generates a random daily speech
  # TODO: Get pull request for yesterday in github public API
  def self.daily
    times = (1..100).to_a.shuffle![3]
    master_commits = (1...10).to_a.shuffle![3]

    <<-HEREDOC
      Mi status de hoy:
     :stub_parrot: Ayer fui intentado _haquiar_ #{times} veces pero aún no lo lograron, recibí un total de 0 pull request y #{master_commits} commits a master.
     :sunny: Hoy estaré en el ampliado de bots y reiniciándome cada vez que Alex Smith :antorcha: intente volver a _haquiarme_ :bored_enerbot: !
     :warning: No hay bloqueos en mis threads, pero siempre es una posibilidad en mi precario hogar :jenkins_triggered:
    HEREDOC
  end
end
