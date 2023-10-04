# Paper Template

Repository outline for my own papers and LaTeX documents.  

Notes:
- System can be switched to XeLatex or other engine supporting unicode in the Makefile.
- Makefile contains 3 targets: main.pdf, anonymized.pdf, and draft.pdf.  Main is for public releases,
  draft includes comments in the main body, and anonymized redacts names (and engages in semi-aggresive
  margin cuts)
- arxiv.tar builds a tar with (hopefully) all files needed for an arxiv release.
- Includes a shell script to split a pdf at a document-defined point (essentially,
  add a command within your tex file right before, e.g., the appendix,
  and then the shell script will know where to split the appendix from the main doc).
- Acm template should work out of the box, but (TODO fix) the others might take a bit of debugging.
    - Weird things happen with UrlBreaks and the url package, depending on the order in which packages are loaded
      and the tex engine used.
      The ACM template takes care of this internally, so you shouldn't need to load url or define UrlBreaks in
      the main tex file, but other document classes may differ (and may be less careful about the order
      packages are loaded).
