import os

def generate_sql(input_file, output_file):
    if not os.path.exists(input_file):
        print(f"Error: {input_file} not found.")
        return

    with open(input_file, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    sql_statements = []

    for line in lines:
        line = line.strip()
        if not line:
            continue
            
        # Splitting by common delimiters used in the list
        if '–' in line:
            parts = line.split('–')
        elif '-' in line:
            parts = line.split('-')
        else:
            continue

        if len(parts) >= 2:
            holiday = parts[0].strip()
            state = parts[1].strip()
            
            # Escape single quotes for SQL safety (e.g., Imam Ali's -> Imam Ali''s)
            holiday_escaped = holiday.replace("'", "''")
            state_escaped = state.replace("'", "''")
            
            sql = f"UPDATE sdp.NATIONAL_HOLIDAYS SET STATE='{state_escaped}' WHERE HOLIDAY_NAME='{holiday_escaped}';"
            sql_statements.append(sql)

    with open(output_file, 'w', encoding='utf-8') as f:
        f.write('\n'.join(sql_statements))

    print(f"Successfully generated {len(sql_statements)} SQL updates in {output_file}")

if __name__ == "__main__":

    generate_sql('holidays_state_mapping.txt', 'update_holidays_2026.sql')
