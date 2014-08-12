class MarkdownRenderer < Redcarpet::Render::HTML

  def block_code(code, language)

    formatter = Rouge::Formatters::HTML.new(wrap: false)
    lexer = Rouge::Lexer.find('html')
  
    if /^block/.match language
    
      <<CODE
<div class="sg-codeExpContanier">
  <div class="sg-codeOutput">
    <div class="sg-codeOutput__label">Example</div>
    <div class="sg-codeOutput__blockPlacer">
      #{code}
    </div>
  </div>
  <div class="sg-codeBlock">
    <div class='highlight'><pre>#{formatter.format(lexer.lex(code))}</pre></div>
  </div>
</div>
CODE
    else
      lexer = Rouge::Lexer.find_fancy('guess', code)
      <<CODE
<div class="sg-codeExpContanier">
  <div class="sg-codeBlock">
    <div class='highlight'><pre>#{formatter.format(lexer.lex(code))}</pre></div>
  </div>
</div>
CODE
    end
  end
  
end
