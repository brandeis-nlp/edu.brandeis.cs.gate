{

    def targetText =  &:TextWithNodes.text()

    def targetAnnotations = []

    targetAnnotations += &:AnnotationSet.Annotation.findAll{&.@Type=="Sentence"}.foreach{
          def targetId = %.s_(&.@Id)
          def targetBegin = %.i_(&.@StartNode)
          def targetEnd = %.i_(&.@EndNode)
          [
            id: targetId,
            start: targetBegin,
            end:  targetEnd,
            "@type":  "http://vocab.lappsgrid.org/Sentence",
            features: [
                word: targetText.substring(targetBegin, targetEnd)
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
                      "http://vocab.lappsgrid.org/Token#pos" {
                          producer  "edu.brandeis.cs.gate.GateOpenNlpSplitter:0.0.1-SNAPSHOT"
                          type  "splitter:gate_opennlp"
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