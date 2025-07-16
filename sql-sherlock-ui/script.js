window.onload = function () {
  const SUPABASE_URL = "https://dxasecazhzapesknvtqv.supabase.co";
  const SUPABASE_ANON_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR4YXNlY2F6aHphcGVza252dHF2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTIzNjExMjksImV4cCI6MjA2NzkzNzEyOX0.FMNFpySQyLtEyESd3YOMAGt8N8ICVlQPoAsnf635huo";

  const supabaseClient = supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

  window.analyze = async function () {
    const sql = document.getElementById("sqlInput").value;
    const resultDiv = document.getElementById("result");
    resultDiv.innerHTML = "🕵️‍♂️ Analyzing...";

    const { data, error } = await supabaseClient.rpc("analyze_query", { input_sql: sql });

    if (error) {
      resultDiv.innerHTML = `<p style="color:red;">❌ Error: ${error.message}</p>`;
    } else if (data.length === 0) {
      resultDiv.innerHTML = `<p style="color:green;">✅ No violations detected!</p>`;
    } else {
      let html = `<table border="1" cellpadding="6">
        <tr><th>Rule Violated</th><th>Severity</th><th>Suggestion</th><th>Score</th></tr>`;
      data.forEach(row => {
        html += `<tr>
          <td>${row.rule_violated}</td>
          <td>${row.severity_level}</td>
          <td>${row.suggestion}</td>
          <td>${row.score}</td>
        </tr>`;
      });
      html += `</table>`;
      resultDiv.innerHTML = html;
    }
  };
};
