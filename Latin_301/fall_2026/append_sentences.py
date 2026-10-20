import re
import sys
from pathlib import Path


def generate_snippet(txt_path="raw.txt", out_path="snippet.html", start_num=45):
    # Resolve paths relative to where this script lives
    script_dir = Path(__file__).parent.resolve()
    input_file = script_dir / txt_path
    output_file = script_dir / out_path

    if not input_file.exists():
        sys.exit(f"Error: '{input_file.name}' not found in {script_dir}")

    raw_content = input_file.read_text(encoding="utf-8")

    # 1. Normalize line endings
    text = raw_content.replace("\r\n", "\n").replace("\r", "\n")

    # 2. Collapse single internal linebreaks within sentences; keep true paragraph breaks
    text = re.sub(r"(?<!\n)\n(?!\n)", " ", text)

    # 3. Collapse multiple spaces and horizontal whitespace
    text = re.sub(r"[ \t]+", " ", text).strip()

    # 4. Tokenize on sentence-ending punctuation (. ? !)
    raw_sentences = re.split(r"(?<=[.?!])\s+", text)
    sentences = [s.strip() for s in raw_sentences if s.strip()]

    if not sentences:
        print("No sentences found to process.")
        return

    # 5. Build the exact HTML grid blocks
    blocks = []
    for idx, sentence in enumerate(sentences, start=start_num):
        block = (
            f'            <div class="grid-container">\n'
            f'                <div class="item1">{idx}</div>\n'
            f'                <div class="item2" lang="lat" data-alpheios_tb_sent="{idx}">{sentence}</div>\n'
            f'                <div class="item3">\n'
            f"                    <ul>\n"
            f"                        <li><b>word</b>: note</li>\n"
            f"                    </ul>\n"
            f"                </div>\n"
            f"            </div>"
        )
        blocks.append(block)

    # 6. Write out the snippet blocks separated by newlines
    output_file.write_text("\n".join(blocks), encoding="utf-8")
    print(
        f"Success: Wrote {len(sentences)} grid containers (sentences {start_num} to {start_num + len(sentences) - 1}) to '{output_file.name}'."
    )


if __name__ == "__main__":
    # Change start_num whenever you start a new batch
    generate_snippet(start_num=45)