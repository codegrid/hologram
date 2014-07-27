class MarkdownRenderer < Redcarpet::Render::HTML

  def block_code(code, language)
  
    if /^block/.match language
    
      <<CODE
<div class="sg-codeExpContanier">
  <div class="sg-codeOutput">
    <div class="sg-codeOutput__label">Example</div>
    <div class="sg-codeOutput__blockPlacer">
      #{code}
    </div>
  </div>
  <div class="sg-codeBlock">#{Pygments.highlight(code)}</div>
</div>
CODE
    else
      <<CODE
<div class="sg-codeExpContanier">
  <div class="sg-codeBlock">#{Pygments.highlight(code)}</div>
</div>
CODE
    end
  end
  
end
