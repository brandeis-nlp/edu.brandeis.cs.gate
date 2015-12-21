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


    targetAnnotations += &:AnnotationSet.Annotation.findAll{&.@Type=="Token"}.foreach{
          def targetId = %.s_(&.@Id)
          def targetBegin = %.i_(&.@StartNode)
          def targetEnd = %.i_(&.@EndNode)
          def targetPos = &.Feature.findAll{&.Name.text()=="category"}[0].Value.text()
          [
            id: targetId,
            start: targetBegin,
            end:  targetEnd,
            "@type":  "http://vocab.lappsgrid.org/Token#pos",
            features: [
                word: targetText.substring(targetBegin, targetEnd),
                pos: targetPos
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
                          producer  "edu.brandeis.cs.gate.GateAnniePOSTagger:0.0.1-SNAPSHOT"
                          type  "tokenizer:gate_opennlp"
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