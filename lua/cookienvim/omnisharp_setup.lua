local M = {}

function M.setup_omnisharp()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    local on_attach = function(client, bufnr)
        -- temporary fix for a roslyn issue in omnisharp
        -- opened issues:
        -- https://github.com/OmniSharp/omnisharp-roslyn/issues/2483
        -- https://github.com/neovim/neovim/issues/21391
        if client.name == "omnisharp" then
            client.server_capabilities.semanticTokensProvider = {
                full = vim.empty_dict(),
                legend = {
                    tokenModifiers = { "static_symbol" },
                    tokenTypes = {
                        "comment",
                        "excluded_code",
                        "identifier",
                        "keyword",
                        "keyword_control",
                        "number",
                        "operator",
                        "operator_overloaded",
                        "preprocessor_keyword",
                        "string",
                        "whitespace",
                        "text",
                        "static_symbol",
                        "preprocessor_text",
                        "punctuation",
                        "string_verbatim",
                        "string_escape_character",
                        "class_name",
                        "delegate_name",
                        "enum_name",
                        "interface_name",
                        "module_name",
                        "struct_name",
                        "type_parameter_name",
                        "field_name",
                        "enum_member_name",
                        "constant_name",
                        "local_name",
                        "parameter_name",
                        "method_name",
                        "extension_method_name",
                        "property_name",
                        "event_name",
                        "namespace_name",
                        "label_name",
                        "xml_doc_comment_attribute_name",
                        "xml_doc_comment_attribute_quotes",
                        "xml_doc_comment_attribute_value",
                        "xml_doc_comment_cdata_section",
                        "xml_doc_comment_comment",
                        "xml_doc_comment_delimiter",
                        "xml_doc_comment_entity_reference",
                        "xml_doc_comment_name",
                        "xml_doc_comment_processing_instruction",
                        "xml_doc_comment_text",
                        "xml_literal_attribute_name",
                        "xml_literal_attribute_quotes",
                        "xml_literal_attribute_value",
                        "xml_literal_cdata_section",
                        "xml_literal_comment",
                        "xml_literal_delimiter",
                        "xml_literal_embedded_expression",
                        "xml_literal_entity_reference",
                        "xml_literal_name",
                        "xml_literal_processing_instruction",
                        "xml_literal_text",
                        "regex_comment",
                        "regex_character_class",
                        "regex_anchor",
                        "regex_quantifier",
                        "regex_grouping",
                        "regex_alternation",
                        "regex_text",
                        "regex_self_escaped_character",
                        "regex_other_escape",
                    },
                },
                range = true,
            }
        end

        -- specifies what to do when language server attaches to the buffer
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    end
    local omnisharp_server_location = os.getenv('UserProfile') .. "\\scoop\\apps\\omnisharp\\current\\OmniSharp.exe"
    local pid = vim.fn.getpid()
    require('lspconfig').omnisharp.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { omnisharp_server_location, "--languageserver", "--hostPID", tostring(pid) },
        handlers = {
            ["textDocument/definition"] = require('omnisharp_extended').handler,
        },
    })
end

return M
