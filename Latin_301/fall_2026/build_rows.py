import re

def process_text(input_path="raw.txt", output_path="output.html"):
    with open(input_path, "r", encoding="utf-8") as f:
        raw_content = f.read()

    # 1. Normalize line endings
    text = raw_content.replace("\r\n", "\n").replace("\r", "\n")

    # 2. Collapse internal wraps: merge lines that don't look like independent paragraph breaks
    # Replace single newlines with a space, but preserve double newlines as paragraph boundaries
    text = re.sub(r'(?<!\n)\n(?!\n)', ' ', text)

    # 3. Collapse multiple spaces/tabs into a single space
    text = re.sub(r'[ \t]+', ' ', text).strip()

    # 4. Tokenize strictly by sentence-ending punctuation (. ? !) followed by space or end of string
    # This regex splits while keeping the punctuation attached to the sentence.
    raw_sentences = re.split(r'(?<=[.?!])\s+', text)

    # Clean and filter out empty strings
    sentences = [s.strip() for s in raw_sentences if s.strip()]

    # 5. Build HTML rows
    with open(output_path, "w", encoding="utf-8") as out:
        for idx, sentence in enumerate(sentences, start=1):
            row_html = (
                f'        <div class="grid-container">\n'
                f'            <div class="item1">{idx}</div>\n'
                f'            <div class="item2" lang="la" data-alpheios_tb_sent="{idx}">{sentence}</div>\n'
                f'            <div class="item3">\n'
                f'                <ul>\n'
                f'                    <li><b>word</b>: note</li>\n'
                f'                </ul>\n'
                f'            </div>\n'
                f'        </div>\n'
            )
            out.write(row_html)

    print(f"Success: {len(sentences)} sentences processed into {output_path}.")

if __name__ == "__main__":
    process_text()