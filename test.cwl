cwlVersion: v1.0
class: Workflow
inputs: {}
outputs:
  outfile:
    type: File
    outputSource: step2/outfile
steps:
  step1:
    run:
      cwlVersion: v1.0
      class: CommandLineTool
      baseCommand: echo
      arguments:
        - Hello! World!
      inputs: {}
      outputs:
        outfile:
          type: stdout
      stdout: test.txt
    in: {}
    out:
      - outfile
  step2:
    run:
      cwlVersion: v1.0
      class: CommandLineTool
      baseCommand: echo
      inputs:
        infile:
          type: File
          streamable: true
      outputs:
        outfile:
          type: stdout
      stdin: $(inputs.infile.path)
      stdout: outfile.txt
    in: 
      infile: step1/outfile
    out:
      - outfile

