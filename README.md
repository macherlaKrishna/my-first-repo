
# Makefile — generates README.md entirely from commands (no manual edits)

.PHONY: all clean
all: README.md

README.md: guessinggame.sh
    @echo "# Guessing Game" > README.md
    @echo >> README.md
    @echo "Generated on: $$(date -u '+%Y-%m-%d %H:%M:%S UTC')" >> README.md
    @echo "Lines of code in guessinggame.sh: $$(wc -l < guessinggame.sh)" >> README.md
    @echo >> README.md
    @echo "Run locally with:" >> README.md
    @echo "\`\`\`bash" >> README.md
    @echo "bash guessinggame.sh" >> README.md
    @echo "\`\`\`" >> README.md

clean:
    @rm -f README.md
