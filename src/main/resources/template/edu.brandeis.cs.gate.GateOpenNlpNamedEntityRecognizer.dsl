{

    def targetText =  &:TextWithNodes.text()

    def targetAnnotations = []

    targetAnnotations += &:AnnotationSet.Annotation.findAll{&.@Type=="Person" || &.@Type=="Location"|| &.@Type=="Organization"}.foreach{
              def targetId = %.s_(&.@Id)
              def targetBegin = %.i_(&.@StartNode)
              def targetEnd = %.i_(&.@EndNode)
              def targetValue = &.@Type
              [
                id: targetId,
                start: targetBegin,
                end:  targetEnd,
                "@type":  "http://vocab.lappsgrid.org/"+targetValue,
                features: [
                    word: targetText.substring(targetBegin, targetEnd),
                ]
              ]
        }

    discriminator  "http://vocab.lappsgrid.org/ns/media/jsonld"

    payload  {
        "@context" "http://vocab.lappsgrid.org/context-1.0.0.jsonld"

        metadata  {

        }

        text {
          "@value" targetText
        }

        views ([
            {
                metadata {
                    contains {
                      "http://vocab.lappsgrid.org/NamedEntity" {
                          producer  "edu.brandeis.cs.gate.GateOpenNlpNamedEntityRecognizer:0.0.1-SNAPSHOT"
                          type  "ner:gate_opennlp"
                      }
                    }
                }


                annotations  (
                    targetAnnotations
                )

            }
        ])
    }

}